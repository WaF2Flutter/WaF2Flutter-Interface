import asyncio
import json
import websockets
import socket
import psutil
import shutil

async def get_system_info():

    cpu_usage = psutil.cpu_percent(interval=1)
    total, used, free = shutil.disk_usage("/")
    cloud_usage_percentage = (used / total) * 100
    cloud_usage_total = f"{total / (1024.0 ** 3):.2f} GB"
    cloud_usage_used = f"{used / (1024.0 ** 3):.2f} GB"
    memory = psutil.virtual_memory()
    memory_usage_percentage = memory.percent
    memory_usage_total = f"{memory.total / (1024.0 ** 3):.2f} GB"
    memory_usage_used = f"{memory.used / (1024.0 ** 3):.2f} GB"


    return {
        'cpu_usage': cpu_usage,
        'cloud_usage_total': cloud_usage_total,
        'cloud_usage_used': cloud_usage_used,
        'cloud_usage_percentage': cloud_usage_percentage,
        'memory_usage_total': memory_usage_total,
        'memory_usage_used': memory_usage_used,
        'memory_usage_percentage': memory_usage_percentage,
    }

async def handle_connection(websocket, path):
    print(f"New connection from {path}")
    system_info = await get_system_info()
    message = {
        'cloud_info': [
            {'title': 'Cpu Usage', 'totalStorage': '100%', 'numOfFiles': 1, 'percentage': system_info['cpu_usage']},
            {'title': 'Cloud Usage', 'totalStorage': system_info['cloud_usage_total'], 'numOfFiles': 1, 'percentage': system_info['cloud_usage_percentage']},
            {'title': 'Memory Usage', 'totalStorage': system_info['memory_usage_total'], 'numOfFiles': 1, 'percentage': system_info['memory_usage_percentage']},
        ],

    }

    await websocket.send(json.dumps(message))
    while True:
        try:
            message = await websocket.recv()
            print(f"Received message from client: {message}")
            if message.startswith('-login'):
                username_password = message[6:]
                username = username_password[:4]
                password = username_password[4:]
                if username == "test" and password == "test":
                    await websocket.send(json.dumps({'login_status': 'success', 'message': 'Login successful'}))
                else:
                    await websocket.send(json.dumps({'login_status': 'failed', 'message': 'Invalid username or password'}))
            else:
                await websocket.send("Unknown command")
        except websockets.ConnectionClosed:
            print('Client disconnected')
            break
        
async def main():
    current_ip = socket.gethostbyname(socket.gethostname())

    async with websockets.serve(handle_connection, current_ip, 8080):
        print(f'Server started on http://{current_ip}:8080')
        await asyncio.Future()  

asyncio.run(main())
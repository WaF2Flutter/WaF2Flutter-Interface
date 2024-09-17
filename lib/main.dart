import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msf/bindings/bindings.dart';
import 'package:msf/screens/HomeScreen.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

const Color bgColor = Color.fromARGB(255, 31, 30, 45);
const Color secondryColor = Color(0xFF2A2D3E);
const Color primaryColor = Color(0xFF2697FF);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),

      getPages: [
        GetPage(name: '/home', page: ()=>HomeScreen()),
        //  GetPage(name: '/Home', page: ()=>HomeScreen()),
        //GetPage(name: '/Home', page: ()=>HomeScreen()),
       //GetPage(name: '/Home', page: ()=>HomeScreen()),
      ],
      initialRoute: '/home',
      title: 'ModSec Admin Panel',
      
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply(bodyColor: Colors.white)),
      ),
      home: HomeScreen(),
    );
  }
}
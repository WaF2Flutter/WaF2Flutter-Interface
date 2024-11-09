import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/LoginController.dart';
import 'package:msf/utills/colorconfig.dart';
import 'package:msf/utills/responsive.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();  // کنترلر برای مدیریت وضعیت

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: Responsive.isDesktop(context) ? screenWidth * 0.5 : screenWidth * 0.9,
          height: Responsive.isDesktop(context) ? screenHeight * 0.5 : screenHeight * 0.7,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: secondryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter OTP",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                "Please enter the OTP sent to your device",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth * 0.8,
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: "OTP",
                    fillColor: secondryColor,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(
                    Responsive.isDesktop(context) ? screenWidth * 0.3 : screenWidth * 0.8,
                    50,
                  ),
                ),
                onPressed: () async {
                  int otp = int.tryParse(otpController.text) ?? 0;
                  if (otp > 0) {
                    // با فراخوانی این متد وضعیت loginProcess را مدیریت می‌کنیم
                    await loginController.verifyOtp(otp);
                  } else {
                    Get.snackbar(
                      "Error",
                      "Please enter a valid OTP",
                      icon: Icon(Icons.error, color: Colors.red),
                      backgroundColor: Colors.white,
                      maxWidth: 360,
                      isDismissible: true,
                    );
                  }
                },
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/LoginController.dart';
import 'package:msf/utills/colorconfig.dart';
import 'package:msf/utills/responsive.dart';

class LoginScreen extends StatelessWidget {
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Responsive.isDesktop(context)
                    ? screenHeight * 0.7
                    : screenHeight * 0.9,
                margin: Responsive.isDesktop(context)
                    ? EdgeInsets.fromLTRB(200, 0, 200, 0)
                    : EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: secondryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: Responsive.isDesktop(context)
                      ? const EdgeInsets.fromLTRB(100, 60, 100, 0)
                      : const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      if (Responsive.isDesktop(context))
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: screenHeight * 0.6,
                                initialPage: 1,
                                autoPlay: true,
                                padEnds: false,
                                enableInfiniteScroll: false,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 1.0,
                              ),
                              items: [
                                Image.asset('img/a_1.jpg'),
                                Image.asset('img/a_2.jpg'),
                                Image.asset('img/a_3.jpg'),
                              ],
                            ),
                          ),
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome to WAF2Flutter!",
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "          Login        ",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: Responsive.isDesktop(context)
                                    ? screenWidth * 0.4
                                    : screenWidth * 0.8,
                                height: 60,
                                child: TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                    fillColor: secondryColor,
                                    filled: true,
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: Responsive.isDesktop(context)
                                    ? screenWidth * 0.4
                                    : screenWidth * 0.8,
                                height: 60,
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    fillColor: secondryColor,
                                    filled: true,
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => Get.find<LoginController>()
                                        .loginProcess
                                        .value
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              primaryColor.withOpacity(0.4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          minimumSize: Size(
                                            Responsive.isDesktop(context)
                                                ? screenWidth * 0.2
                                                : screenWidth * 0.8,
                                            50,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (!Get.find<LoginController>()
                                              .loginProcess
                                              .value) {
                                            Get.find<LoginController>().login(
                                                usernameController.text,
                                                passwordController.text);
                                          }
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text("Demo Login method using pre defined username and pass")
            ],
          );
        },
      ),
    );
  }
}

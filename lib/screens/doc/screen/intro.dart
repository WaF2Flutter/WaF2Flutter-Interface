import 'package:flutter/material.dart';
import '../components/Header.dart';

class IntroScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const IntroScreen({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(scaffoldKey: scaffoldKey),
            const SizedBox(height: 16),
            Column(
              children: [
              Text("Welcome to the ModSecurity Admin Panel!"),
                Text("In this docs you will learn how to use properly this Panel"),
                Text("So! Lets get started with basics!"),
                
                Text("As you know this admin panel on top of CRS OWSAP the ModSecurity engine."),
                Text("With this engine we can ")

              ],
            ),
          ],
        ),
      ),
    );
  }
}

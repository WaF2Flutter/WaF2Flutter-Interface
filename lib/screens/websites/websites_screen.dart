import 'package:flutter/material.dart';
import '../component/Header.dart';

class websites_screen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey; // Pass the GlobalKey to this widget

  websites_screen({Key? key, required this.scaffoldKey}) : super(key: key); // Constructor to receive the GlobalKey

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(scaffoldKey: scaffoldKey), // Pass the scaffoldKey to Header
            const SizedBox(height: 16),
            Column(
              children: [
                // Your content here
              ],
            ),
          ],
        ),
      ),
    );
  }
}

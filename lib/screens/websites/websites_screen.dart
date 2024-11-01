import 'package:flutter/material.dart';
import '../component/Header.dart';

class websites_screen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  websites_screen({Key? key, required this.scaffoldKey}) : super(key: key);

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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

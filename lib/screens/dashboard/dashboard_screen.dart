import 'package:flutter/material.dart';
import '../component/Header.dart';
import 'sections/Dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column( 
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Line1(),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Dashboard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}


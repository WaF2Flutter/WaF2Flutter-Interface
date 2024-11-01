import 'package:flutter/material.dart';
import 'components/drawer.dart';

class doc extends StatelessWidget {
  const doc({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      drawer: drawer(),
      body: Column(
        children: [
          Text("Welcome to the WAFtoFlutter interface manual!"),
          Text("In this manual you will lean how to use and control your waf effectivly with our WAF interface"),
        ],
      ),
    );
  }
}
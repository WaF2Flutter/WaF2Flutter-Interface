import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("1. Introduce"),
          ),
          ListTile(
            title: Text("2. Setup"),
          ),
          ListTile(
            title: Text("3. Control panel"),
          ),
          ListTile(
            title: Text("3. Api-Refrence"),
          ),
        ],
      ),
    );
  }
}

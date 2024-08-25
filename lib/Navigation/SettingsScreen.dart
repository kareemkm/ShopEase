
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        titleTextStyle: TextStyle(color: Colors.grey.shade200,fontSize: 25),
        backgroundColor: Colors.orange,

      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Icon(Icons.logout),
            Text("Log Out"),
          ],
        ),
      ),
    );
  }

}
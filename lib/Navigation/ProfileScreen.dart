

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        titleTextStyle: TextStyle(color: Colors.grey.shade200,fontSize: 25),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 300),
            Text(
                "The program was created by\n Mahmoud Shaban Mohamed Abdel Fattah.",
              style: TextStyle(color: Colors.orange , fontSize: 16 , fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );

  }

}
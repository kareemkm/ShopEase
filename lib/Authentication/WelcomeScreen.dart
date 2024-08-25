import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.orange.shade900,
                      Colors.orange.shade800,
                      Colors.orange.shade400
                    ]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                const SizedBox(height:80),
                Padding(
                    padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/shopping.png',height: 250,width: 250,),
                      const SizedBox(height: 40),
                      const Text(
                          "ShopEase"
                          ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                           )
                      )
                    ],
                  ),
                ),
                const SizedBox(height:30),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(60) ,topRight: Radius.circular(60))
                      ),
                      child: Container(
                        child: Center(
                          child: Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.orange),),
                        ),
                      )
                    )
                )
              ],
            ),
          ),
        )
      )
    );
  }

}



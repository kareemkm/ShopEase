
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{
  final String name;
  final int id;
  final List<String> images ;
  final double price ;
  final double rating ;
  final String description ;

  DetailScreen({
    required this.name,
    required this.id,
    required this.images,
    required this.price,
    required this.rating,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.orange.shade100,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          color: Colors.orange.shade50,
          child: Column(
            children: [
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        images[0],
                        width: 150,
                        height: 400,
                      ),
                    ),
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        images[1],
                        width: 150,
                        height: 400,
                      ),
                    ),
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        images[2],
                        width: 150,
                        height: 400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Icon(CupertinoIcons.money_dollar,size: 40,color: Colors.green,),
                  Text(price.toString(),style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.bold)),
                  SizedBox(width: 120,),
                  Icon(Icons.star_half,size: 20,color: Colors.orange,),
                  Text(rating.toString(),style: TextStyle(color: Colors.orange,fontSize: 18),)
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                child: Text(description),
              ),

            ],
          ),
        ),
      )
    );
  }

}
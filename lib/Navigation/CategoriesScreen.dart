import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/API/Category.dart';
import 'package:flutter_project/smartphonesList/ProductsScreen.dart';



class CategoriesScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
          titleTextStyle: TextStyle(color: Colors.grey.shade200,fontSize: 25),
          backgroundColor: Colors.orange,
        ),
          body:FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context,snapshot) {
                if( snapshot.hasData){
                  List<Category> categories = snapshot.data!;
                  return ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context , index){
                        return ListTile(
                          title: Text(categories[index].name),
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductsScreen(categoryName: categories[index].name,)
                                )
                            );
                          },
                        );
                      }
                  );
                }else{
                  if (snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }
              }
          )

      );
  }

}
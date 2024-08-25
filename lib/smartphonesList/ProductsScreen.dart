import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/API/FetchApi.dart';
import 'package:flutter_project/API/ProductsModel.dart';
import 'package:flutter_project/smartphonesList/DetailScreen.dart';

class ProductsScreen extends StatelessWidget{

  final  String categoryName ;
  ProductsScreen({required this.categoryName});
  @override
  FetchApi fetchApi = FetchApi();



  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryName'),
          titleTextStyle: TextStyle(color: Colors.grey.shade200,fontSize: 25),
          backgroundColor: Colors.orange,
        ),
        body: FutureBuilder<List<ProductsModel>>(
          future: fetchApi.fetchProducts(categoryName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No products found.'));
            } else {
              List<ProductsModel> products = snapshot.data!;
              return Container(
                padding: EdgeInsets.all(20),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2,color: Colors.orange),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      name:products[index].title,
                                      id: products[index].id,
                                      images: products[index].images,
                                      price: products[index].price,
                                      rating: products[index].rating,
                                      description: products[index].description,
                                    )
                                )
                                );
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        width: 150,
                                        height: 150,
                                        child:Image.network(
                                          products[index].images[0],
                                            fit: BoxFit.fill
                                        )
                                    ),
                                    const SizedBox(height: 10),
                                    SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(products[index].title),),
                                    SizedBox(height: 10),
                                   SingleChildScrollView(
                                     scrollDirection: Axis.horizontal,
                                     child:  Row(
                                       children: [
                                         Icon(CupertinoIcons.money_dollar,size: 20,),
                                         Text(products[index].price.toString(),style: TextStyle(color: Colors.green),),
                                         const SizedBox(width: 15),
                                         const Icon(CupertinoIcons.star_lefthalf_fill,size: 15,),
                                         const SizedBox(width: 3),
                                         Text(products[index].rating.toString(),style: TextStyle(color: Colors.amber,fontSize: 12),)
                                       ],
                                     ),
                                   )
                                  ],
                                ),
                              ),
                            )
                        );
                      },
                    )
              );
            }
          },
        ),
    );

  }

}
class ProductsModel {
  final String category ;
  final int id ;
   final String title ;
   final String thumbnail ;
   final List<String> images ;
   final double price ;
   final double rating ;
   final String description ;

   ProductsModel({
    required this.id ,
    required this.title,
     required this.thumbnail,
     required this.images,
     required this.price,
     required this.rating,
     required this.description,
      required this.category,
  });

  factory ProductsModel.fromJson(Map<String,dynamic>json){
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      thumbnail:json['thumbnail'],
      images: List<String>.from(json['images']),
      price: json['price'],
      rating: json['rating'],
      description: json['description'],
      category: json['category']
    );
  }

}

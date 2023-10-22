class FoodModel {
  String name;
  String price;
  String imagePath;
  String rating;

  FoodModel(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.rating});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'rating': rating,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      name: map['name'] as String,
      price: map['price'] as String,
      imagePath: map['imagePath'] as String,
      rating: map['rating'] as String,
    );
  }
}

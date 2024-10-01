class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final double rating;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      rating: json['rating']['rate'].toDouble(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'rating': rating,
      'category': category,
    };
  }
}

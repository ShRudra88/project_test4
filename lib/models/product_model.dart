class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> images;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.images,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    price: json['price'].toDouble(),
    rating: json['rating'].toDouble(),
    category: json['category'],
    images: List<String>.from(json['images']),
  );
}

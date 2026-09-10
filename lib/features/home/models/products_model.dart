class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String description;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.description,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      brand: map['brand'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? 0,
      category: map['category'] ?? '',
      description: map['description'] ?? '',
    );
  }
}

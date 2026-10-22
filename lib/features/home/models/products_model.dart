class Product {
  final String id;
  final String name;
  final String brand;
  final String imageUrl;
  final double price;
  final String category;
  final String categoryId;
  final String description;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.description,
    required this.id,
    required this.categoryId,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      brand: map['brand'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? 0,
      categoryId: map['categoryId'] ?? '',
      category: map['category'] ?? '',
      description: map['description'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Product &&
        other.name == name &&
        other.brand == brand &&
        other.imageUrl == imageUrl &&
        other.price == price &&
        other.category == category &&
        other.description == description;
  }

  @override
  int get hashCode =>
      Object.hash(name, brand, imageUrl, price, category, description);
}

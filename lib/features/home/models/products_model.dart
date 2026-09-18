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

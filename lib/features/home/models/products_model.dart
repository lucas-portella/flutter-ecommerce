class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      brand: map['brand'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? 0,
    );
  }
}

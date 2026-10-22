class Category {
  final String id;
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl, required this.id});

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      id: map['id'] ?? '',
    );
  }
}

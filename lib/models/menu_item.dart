class MenuItem {
  final String name;
  final double price;
  final String imageUrl;

  const MenuItem({
    required this.name,
    required this.price,
    this.imageUrl = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? "",
    );
  }
}

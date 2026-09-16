
class Category {
  final String id;
  final String code;
  final String name;
  final int displayOrder;

  const Category({
    required this.id,
    required this.code,
    required this.name,
    required this.displayOrder,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
    );
  }
}
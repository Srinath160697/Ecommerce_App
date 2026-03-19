import 'dart:convert';

class Category {
  final String id;
  final String name;
  final String image;
  final String banner;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.banner,
  });

  /// From Map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      banner: map['banner'] ?? '',
    );
  }

  /// To Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'image': image, 'banner': banner};
  }

  /// From JSON (String → Object)
  factory Category.fromJson(String source) {
    return Category.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  /// To JSON (Object → String)
  String toJson() {
    return json.encode(toMap());
  }
}

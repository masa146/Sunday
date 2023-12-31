import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  bool success;
  List<Category> data;
  String message;

  Categories({
    required this.success,
    required this.data,
    required this.message,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    success: json["success"],
    data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Category {
  String categoryName;
  String cataegoryImage;
  int id;

  Category({
    required this.categoryName,
    required this.cataegoryImage,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryName: json["category_name"],
    cataegoryImage: json["cataegory_image"].replaceAll("127.0.0.1", "192.168.1.103"),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "cataegory_image": cataegoryImage,
    "id": id,
  };
}

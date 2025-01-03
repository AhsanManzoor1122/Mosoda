class SubCategories {
  String code;
  bool status;
  Data data;
  SubCategories({required this.code, required this.status, required this.data});

  factory SubCategories.fromJson(Map<String, dynamic> json) {
    return SubCategories(
        code: json['code'],
        status: json['status'],
        data: Data.fromJson(json['data']));
  }
}

class Data {
  String catId;
  String title;
  List<SubCategoriesData> subcategories;
  Data({required this.catId, required this.title, required this.subcategories});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      catId: json['cat_id'],
      title: json['title'],
      subcategories: (json['subcategories'] as List<dynamic>)
          .map((item) => SubCategoriesData.fromJson(item))
          .toList(),
    );
  }
}

class SubCategoriesData {
  int id;
  String title;
  String arTitle;
  String description;
  String arDescription;
  String image;
  SubCategoriesData(
      {required this.id,
      required this.title,
      required this.arTitle,
      required this.description,
      required this.arDescription,
      required this.image});

  factory SubCategoriesData.fromJson(Map<String, dynamic> json) {
    return SubCategoriesData(
        id: json['id'],
        title: json['title'],
        arTitle: json['ar_title'],
        description: json['description'],
        arDescription: json['ar_description'],
        image: json['image']);
  }
}

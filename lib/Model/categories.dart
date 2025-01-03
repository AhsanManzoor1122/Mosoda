class Catetgories {
  String code;
  bool status;
  Data data;
  Catetgories({required this.code, required this.status, required this.data});

  Catetgories.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        status = json['status'],
        data = Data.fromJson(json['data']);
}

class Data {
  String title;
  int page;
  int limit;
  int pageCount;
  int totalCount;
  List<CategoryList>? categories;
  Data(
      {required this.title,
      required this.page,
      required this.limit,
      required this.pageCount,
      required this.totalCount,
      required this.categories});
  Data.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        page = json['page'],
        limit = json['limit'],
        pageCount = json['page_count'],
        totalCount = json['total_count'],
        categories = (json['categories'] as List<dynamic>?)
                ?.map((item) => CategoryList.fromJson(item))
                .toList() ??
            [];
}

class CategoryList {
  int id;
  String title;
  String arTitle;
  String description;
  String arDescription;
  String image;
  String banImage;
  String isOrder;
  CategoryList(
      {required this.id,
      required this.title,
      required this.arTitle,
      required this.description,
      required this.arDescription,
      required this.image,
      required this.banImage,
      required this.isOrder});
  CategoryList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        arTitle = json['ar_title'],
        description = json['description'],
        arDescription = json['ar_description'],
        image = json['image'],
        banImage = json['ban_image'],
        isOrder = json['is_order'];
}

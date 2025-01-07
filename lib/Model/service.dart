class Service {
  String? code;
  bool? status;
  Data? data;
  String? message;

  Service({this.code, this.status, this.data, this.message});

  Service.fromJson(Map<String, dynamic> json) {
    code = json['code']?.toString();
    status = json['status'] as bool?;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['code'] = code;
    result['status'] = status;
    if (data != null) {
      result['data'] = data!.toJson();
    }
    result['message'] = message;
    return result;
  }
}

class Data {
  String? catId;
  String? subCatId;
  String? title;
  String? page;
  String? limit;
  int? pageCount;
  int? totalCount;
  List<Services>? services;

  Data({
    this.catId,
    this.subCatId,
    this.title,
    this.page,
    this.limit,
    this.pageCount,
    this.totalCount,
    this.services,
  });

  Data.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id']?.toString();
    subCatId = json['sub_cat_id']?.toString();
    title = json['title']?.toString();
    page = json['page']?.toString();
    limit = json['limit']?.toString();
    pageCount = json['page_count'] is int
        ? json['page_count']
        : int.tryParse(json['page_count']?.toString() ?? '0');
    totalCount = json['total_count'] is int
        ? json['total_count']
        : int.tryParse(json['total_count']?.toString() ?? '0');
    if (json['services'] != null && json['services'] is List) {
      services = (json['services'] as List)
          .map((v) => Services.fromJson(v as Map<String, dynamic>))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['cat_id'] = catId;
    result['sub_cat_id'] = subCatId;
    result['title'] = title;
    result['page'] = page;
    result['limit'] = limit;
    result['page_count'] = pageCount;
    result['total_count'] = totalCount;
    if (services != null) {
      result['services'] =
          services!.map((service) => service.toJson()).toList();
    }
    return result;
  }
}

class Services {
  int? id;
  String? title;
  String? arTitle;
  String? description;
  String? arDescription;
  String? image;
  String? hasSubServices;

  Services({
    this.id,
    this.title,
    this.arTitle,
    this.description,
    this.arDescription,
    this.image,
    this.hasSubServices,
  });

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int
        ? json['id']
        : int.tryParse(json['id']?.toString() ?? '0');
    title = json['title']?.toString();
    arTitle = json['ar_title']?.toString();
    description = json['description']?.toString();
    arDescription = json['ar_description']?.toString();
    image = json['image']?.toString();
    hasSubServices = json['has_sub_services']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['id'] = id;
    result['title'] = title;
    result['ar_title'] = arTitle;
    result['description'] = description;
    result['ar_description'] = arDescription;
    result['image'] = image;
    result['has_sub_services'] = hasSubServices;
    return result;
  }
}

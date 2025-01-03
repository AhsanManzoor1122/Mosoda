class Service {
  String? code;
  bool? status;
  Data? data;
  String? message;

  Service({this.code, this.status, this.data, this.message});

  Service.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
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

  Data(
      {this.catId,
      this.subCatId,
      this.title,
      this.page,
      this.limit,
      this.pageCount,
      this.totalCount,
      this.services});

  Data.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    subCatId = json['sub_cat_id'];
    title = json['title'];
    page = json['page'];
    limit = json['limit'];
    pageCount = json['page_count'];
    totalCount = json['total_count'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['sub_cat_id'] = this.subCatId;
    data['title'] = this.title;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['page_count'] = this.pageCount;
    data['total_count'] = this.totalCount;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
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
    id = json['id'];
    title = json['title'];
    arTitle = json['ar_title'];
    description = json['description'];
    arDescription = json['ar_description'];
    image = json['image'];

    hasSubServices = json['has_sub_services'];
    if (json['subservices'] != null) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ar_title'] = this.arTitle;
    data['description'] = this.description;
    data['ar_description'] = this.arDescription;
    data['image'] = this.image;

    data['has_sub_services'] = this.hasSubServices;

    return data;
  }
}

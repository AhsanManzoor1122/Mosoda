import 'package:flutter/material.dart';
import 'package:mosoda/Model/categories.dart';
import 'package:mosoda/Model/service.dart';
import 'package:mosoda/Model/sub_categories.dart';
import 'package:mosoda/Repository/cat_repository.dart';

class CartViewModel with ChangeNotifier {
  CatRepository repo = CatRepository();

  Future<Catetgories> categories(dynamic data, BuildContext context) async {
    try {
      final result = await repo.categories(data);
      return Catetgories.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<SubCategories> subCategories(dynamic data) async {
    try {
      final result = await repo.subCategories(data);

      return SubCategories.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<Service> service(dynamic data) async {
    try {
      final result = await repo.service(data);
      return Service.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
}

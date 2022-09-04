import 'package:flutter/material.dart';

class IdModel extends ChangeNotifier {
  String _categoryId = "3";

  String _subCategoryId = "5";

  String get getCategoryId => _categoryId;
  String get getSubCategoryId => _subCategoryId;

  set setCategoryId(String id) {
    _categoryId = id;
    notifyListeners();
  }

  init() {
    _categoryId = "3";
    _subCategoryId = "5";
    notifyListeners();
  }

  set setSubCategoryId(String id) {
    _subCategoryId = id;
    notifyListeners();
  }
}

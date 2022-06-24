import 'package:zoomie_kot/models/category.dart';
import 'package:zoomie_kot/models/product.dart';
import 'package:zoomie_kot/models/sub_category.dart';
import 'package:zoomie_kot/utils/network_service.dart';

import 'table.dart';

Future<List<Category>> getCategories() async {
  List data = await getData("Category", post: false);
  return data.map((json) => Category.fromJson(json)).toList();
}

Future<List<Table>> getTables() async {
  List data = await getData("Table", post: false);
  return data.map((json) => Table.fromJson(json)).toList();
}

Future<List<SubCategory>> getSubCategory(String categoryId) async {
  final params = {"categoryId": categoryId};
  List data = await getData("SubCategory?categoryId=$categoryId",
      post: false, params: params);
  return data.map((json) => SubCategory.fromJson(json)).toList();
}

Future<List<Product>> getProduct(String subCategoryId) async {
  final params = {"subCategId": subCategoryId};
  List data = await getData(
      "product/GetProdListBySubCateg?subCategId=$subCategoryId",
      post: false,
      params: params);

  return data.map((json) => Product.fromJson(json)).toList();
}

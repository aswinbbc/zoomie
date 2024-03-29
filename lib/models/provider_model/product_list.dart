import 'package:flutter/material.dart';
import 'package:zoomie_kot/models/pending_details.dart';

import '../product.dart';

class ProductsListModel with ChangeNotifier {
  final List<CartItem> _lst = [];
  double _total = 0;
  List<CartItem> get productList => _lst;
  int get count => _lst.length;
  double get total {
    _total = 0;
    for (var element in _lst) {
      _total += element.quantity * double.parse(element.product.retailprice!);
    }
    return _total;
  }

  List<CartItem> getProductsByKitchen(String kitchenId) {
    return _lst
        .where((element) => element.product.kitchenId == kitchenId)
        .toList();
  }

  init() {
    _lst.clear();
    _total = 0;
    notifyListeners();
  }

  add(Product product, int quantity) {
    _lst.add(CartItem(product, quantity));
    notifyListeners();
  }

  // addNarration(String narration, int index) {
  //   _lst.elementAt(index).product.narration = narration;
  //   notifyListeners();
  // }

  edit(int index, Product product, int quantity) {
    _lst[index] = CartItem(product, quantity);
    notifyListeners();
  }

  delete(CartItem item) {
    _lst.remove(item);
    notifyListeners();
  }

  deleteById(int index) {
    _lst.removeAt(index);
    notifyListeners();
  }

  addPendings(List<PendingItemModel> list) {
    var items = list.map((pendingItem) {
      Product product = Product(
        prodId: pendingItem.productId,
        prodName: pendingItem.prodName,
        retailprice: pendingItem.price!,
      );
      int quantity = double.parse(pendingItem.qty!).toInt();
      return CartItem(product, quantity, rowId: pendingItem.rowId!);
    });

    _lst.addAll(items);
    notifyListeners();
  }
}

class CartItem {
  Product product;
  int quantity;
  String rowId;
  CartItem(this.product, this.quantity, {this.rowId = "0"});
}

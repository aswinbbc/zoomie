import 'package:flutter/material.dart';

import '../product.dart';

class ProductsListModel with ChangeNotifier {
  final List<CartItem> _lst = [];
  double _total = 0;
  List<CartItem> get productList => _lst;
  int get count => _lst.length;
  double get total {
    _total = 0;
    for (var element in _lst) {
      _total += element.quantity * double.parse(element.product.retailPrice!);
    }
    return _total;
  }

  add(Product product, int quantity) {
    _lst.add(CartItem(product, quantity));
    notifyListeners();
  }

  edit(int index, Product product, int quantity) {
    _lst[index] = CartItem(product, quantity);
    notifyListeners();
  }

  delete(CartItem item) {
    // _lst.removeWhere(((CartItem element) => (element.product == item.product &&
    //     element.quantity == item.quantity)));
    _lst.remove(item);
    notifyListeners();
  }

  deleteById(int index) {
    _lst.removeAt(index);
    // print(index);
    notifyListeners();
  }
}

class CartItem {
  Product product;
  int quantity;
  CartItem(this.product, this.quantity);
}

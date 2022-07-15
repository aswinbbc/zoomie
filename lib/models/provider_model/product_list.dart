import 'package:flutter/material.dart';

import '../product.dart';

class ProductsListModel with ChangeNotifier {
  List<CartItem> _lst = [];

  List<CartItem> get productList => _lst;
  int get count => _lst.length;

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
}

class CartItem {
  Product product;
  int quantity;
  CartItem(this.product, this.quantity);
}

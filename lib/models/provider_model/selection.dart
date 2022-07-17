import 'package:flutter/material.dart';

class Selection extends ChangeNotifier {
  String _type = "Dining",
      _table = "0",
      _carNo = "",
      _contactNo = "",
      _contactName = "";
  String get type => _type;
  String get table => _table;
  String get carNo => _carNo;
  String get contactNo => _contactNo;
  String get contactName => _contactName;

  set setType(String type) {
    _type = type;
    notifyListeners();
  }

  set setTable(String table) {
    _table = table;
    print(_table);
    notifyListeners();
  }

  set setCarNo(String carno) {
    _carNo = carno;
    notifyListeners();
  }

  set setContactNo(String contact) {
    _contactNo = contact;
    notifyListeners();
  }

  set setContactName(String name) {
    _contactName = name;
    notifyListeners();
  }
}

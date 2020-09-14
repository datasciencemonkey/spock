import 'package:flutter/material.dart';
import 'package:omnikit/models/models.dart';

class CartProducts with ChangeNotifier {
  List<Content> _items = [];

  List<Content> get items {
    return [..._items];
  }

  void addProduct(Content item) {
    _items.add(item);
    notifyListeners();
  }
}

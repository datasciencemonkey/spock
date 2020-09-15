import 'package:get/get.dart';
import 'package:omnikit/models/models.dart';

class UserCartProductsController extends GetxController {
  List<Content> _items = [];
  String _user;

// getter for items
  List<Content> get items {
    return [..._items];
  }

// getter for user
  String get user => _user;

 void emptyCart() {
    _items.clear();
    // _items = List<Content>();
  }

// add product to cart
  void addProduct(Content item) {
    _items.add(item);
    update();
  }

// update user post login
  void updateUser(String user) {
    _user = user;
    update();
  }
}

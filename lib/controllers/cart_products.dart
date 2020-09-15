import 'package:get/get.dart';
import 'package:omnikit/models/models.dart';

class UserCartProductsController extends GetxController {
  List<Content> _items = [];
  String _user;

  List<Content> get items {
    return [..._items];
  }

  void addProduct(Content item) {
    _items.add(item);
    update();
  }

  void updateUser(String user) {
    _user = user;
    update();
  }
}

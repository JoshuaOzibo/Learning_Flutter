import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/models/static.dart';
import 'package:flutter_application_1/simple_cart/repositories/product_repository.dart';

class ProductViewmodel extends ChangeNotifier {
  final _repository = ProductRepository();

  List<Product> _productList = [];
  List<Product> get getProduct => _productList;
  List<Product> _cart = [];
  List<Product> get getCart => _cart;

  Future<void> fetch() async {
    final productList = await _repository.fetchFood();
    _productList = productList;
    notifyListeners();
  }

  void addToCart(product) {
    _cart.add(product);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/simple_cart/repositories/product_repository.dart';
import 'package:flutter_application_1/simple_cart/static.dart';

class ProductViewmodel extends ChangeNotifier {
  final ProductRepository _productRepository;
  ProductViewmodel(this._productRepository);

  List<Product> products = [];

  Future<void> fetchProduct() async {
    final data = await _productRepository.fetchProduct();
    products = data;
    notifyListeners();
  }
}

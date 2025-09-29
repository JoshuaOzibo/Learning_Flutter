
import 'package:flutter_application_1/simple_cart/models/static.dart';
import 'package:flutter_application_1/simple_cart/static_two.dart';

class ProductRepository {
  Future<List<Product>> fetchFood() async{
    return productList.map((item) => item).toList();
  }
}
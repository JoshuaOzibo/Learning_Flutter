
import 'package:flutter_application_1/simple_cart/static.dart';

class ProductRepository{
  Future<List<Product>>  fetchProduct() async{
    return [
      Product(id: 1, quantity: 1, image: '', title: 'Tomanto', subTitle: 'sweet', price: 10, rating: 2.5),
      Product(id: 1, quantity: 1, image: '', title: 'Tomanto', subTitle: 'sweet', price: 10, rating: 2.5),
      Product(id: 1, quantity: 1, image: '', title: 'Tomanto', subTitle: 'sweet', price: 10, rating: 2.5),
    ];
  } 
}
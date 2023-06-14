import 'dart:convert';

import 'package:api/Model/CartModel.dart';
import 'package:api/Model/ProductModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  bool isLastPage = false;
  bool cartLastPage = false;
  int pageProduct = 0, pageCart = 0;
  final int _numberOfPostsPerRequest = 10;
  bool isUpdate = false;
  late bool isLoading;
   bool cartLoading =false;
  late Uri postUrl, cartUrl;
  List<Product> products = <Product>[];
  List<Cart> carts = <Cart>[];

  Future<void> getProducts() async {
    if (products.isNotEmpty) {
      isLoading = true;
      update();
    }
    postUrl = Uri.parse(
        "https://dummyjson.com/products?skip=${pageProduct*10}&limit=$_numberOfPostsPerRequest");
    final response = await http.get(postUrl);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['products'];
      products
          .addAll(data.map<Product>((json) => Product.fromMap(json)).toList());
      isLastPage = data.map<Product>((json) => Product.fromMap(json)).toList().length < _numberOfPostsPerRequest;
      pageProduct++;
    }
    if (products.isNotEmpty) {
      isLoading = false;
    }
    if (!isUpdate) {
      isUpdate = true;
    }
    update();
  }

  Future<void> getCarts() async {
    if (carts.isNotEmpty) {
      cartLoading = true;
      update();
    }
    cartUrl = Uri.parse(
        "https://dummyjson.com/carts?skip=${pageCart*10}&limit=$_numberOfPostsPerRequest");
    final response = await http.get(cartUrl);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['carts'];
      carts.addAll(data.map<Cart>((json) => Cart.fromMap(json)).toList());
      cartLastPage = data.map<Cart>((json) => Cart.fromMap(json)).toList().length < _numberOfPostsPerRequest;
      pageCart++;
    }
    if (carts.isNotEmpty) {
      cartLoading = false;
    }
    update();
  }
}

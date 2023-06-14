import 'package:api/Model/ProductsModel.dart';

class Cart {
  int id;
  List<Products> products;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  Cart(this.id, this.products, this.total, this.discountedTotal, this.userId,
      this.totalProducts, this.totalQuantity);

  factory Cart.fromMap(Map<String, dynamic> json) {
    return Cart(
        json['id'],
        [...?json['products']].map<Products>((json) => Products.fromMap(json)).toList(),
        json['total'],
        json['discountedTotal'],
        json['userId'],
        json['totalProducts'],
        json['totalQuantity']);
  }
}

class Products {
  int id;
  String title;
  int price;
  int quantity;
  int total;
  double discountPercentage;
  int discountedPrice;

  Products(this.id, this.title, this.price, this.quantity, this.total,
      this.discountPercentage, this.discountedPrice);

  factory Products.fromMap(Map<String, dynamic> json) {
    return Products(
        json['id'],
        json['title'],
        json['price'],
        json['quantity'],
        json['total'],
        json['discountPercentage'] == null
            ? 0.0
            : json['discountPercentage'].toDouble(),
        json['discountedPrice']);
  }
}

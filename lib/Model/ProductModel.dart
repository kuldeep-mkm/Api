class Product {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Product(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
        json['id'],
        json['title'],
        json['description'],
        json['price'],
        json['discountPercentage'] == null ? 0.0 : json['discountPercentage'].toDouble(),
        json['rating'] == null ? 0.0 : json['rating'].toDouble(),
        json['stock'],
        json['brand'],
        json['category'],
        json['thumbnail'],
        [...?json['images']]);
  }

}

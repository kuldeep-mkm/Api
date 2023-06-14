import 'package:api/Model/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Product product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  static const image = "assets/images.png";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(widget.product.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black)),
            const SizedBox(height: 10),
            Flexible(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.product.images[index],
                        errorBuilder: (context, exception, stackTrack) => Image(
                            image: const AssetImage(image),
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: 200),
                        width: MediaQuery.of(context).size.width - 10,
                        height: 100,
                        fit: BoxFit.cover,
                      );
                    }),
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.product.description,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black)),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    const Text("Category: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.product.category,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("Brand: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.product.brand,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    const Text("price: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),
                    Text(widget.product.price.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("Discount Percentage: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.product.discountPercentage.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Row(
                  children: [
                    const Text("Rating: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),
                    Text(widget.product.rating.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("Stock: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.product.stock.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

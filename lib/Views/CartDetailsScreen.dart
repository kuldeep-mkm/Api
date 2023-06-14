
import 'package:api/Model/CartModel.dart';
import 'package:flutter/material.dart';

class CartDetail extends StatefulWidget {
  Cart cart;
   CartDetail({Key? key,required this.cart}) : super(key: key);

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    const Text("Id: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.cart.id.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("UserID: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.cart.userId.toString(),
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
                    const Text("Total: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.cart.total.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("Discounted Total: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.cart.discountedTotal.toString(),
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
                    const Text("Total Product: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.cart.totalProducts.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("Total Quantity: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black)),

                    Text(widget.cart.totalQuantity.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("products: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(shrinkWrap: true,itemCount: widget.cart.products.length,itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.black12, width: 2)),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(widget.cart.products[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Text("Id: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),

                              Text(widget.cart.products[index].id.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black)),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text("Price: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),

                              Text(widget.cart.products[index].price.toString(),
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
                              const Text("Quantity: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),

                              Text(widget.cart.products[index].quantity.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black)),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text("Total: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black)),

                              Text(widget.cart.products[index].total.toString(),
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
                          const Text("Discount Percentage: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black)),

                          Text(widget.cart.products[index].discountPercentage.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text("Discounted Price: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black)),

                          Text(widget.cart.products[index].total.toString(),
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    ));
  }
}

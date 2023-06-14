import 'package:api/Views/CartDetailsScreen.dart';
import 'package:api/Views/ProductDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/MainController.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.put(MainController());

  static const image = "assets/images.png";
  final ScrollController _scrollController = ScrollController();
  final ScrollController cartController = ScrollController();
  bool isData = true;
  bool isCartData = true;

  @override
  void initState() {
    controller.getCarts();
    controller.getProducts();
    _scrollController.addListener(_onScroll);
    cartController.addListener(onCartScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    cartController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        isData) {
      controller.getProducts();
      if (controller.isLastPage) {
        isData = false;
      }
    }
  }

  void onCartScroll(){
    if (cartController.position.pixels ==
        cartController.position.maxScrollExtent &&
        isCartData) {
      controller.getCarts();
      if (controller.isLastPage) {
        isCartData = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Products",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Carts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
              )
            ],
          ),
          body: GetBuilder<MainController>(
              builder: (controller) => controller.isUpdate
                  ? Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: TabBarView(children: [
                            ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemCount: controller.products.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black12, width: 2)),
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                          Get.to(()=> ProductDetails(product: controller.products[index]));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.products[index].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                          const SizedBox(height: 10),
                                          Image.network(
                                            controller
                                                .products[index].thumbnail,
                                            errorBuilder: (context, exception,
                                                    stackTrack) =>
                                                Image(
                                                    image:
                                                        const AssetImage(image),
                                                    fit: BoxFit.fill,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 200),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 200,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                              controller
                                                  .products[index].description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black)),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Price: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                              Text(
                                                  controller
                                                      .products[index].price
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                              const SizedBox(width: 15),
                                              const Text("Discounted Price: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                              Text(
                                                  (controller.products[index]
                                                              .price -
                                                          ((controller
                                                                      .products[
                                                                          index]
                                                                      .discountPercentage *
                                                                  controller
                                                                      .products[
                                                                          index]
                                                                      .price) ~/
                                                              100))
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            ListView.builder(
                                shrinkWrap: true,
                                controller: cartController,
                                itemCount: controller.carts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black12, width: 2)),
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to( ()=>CartDetail(cart: controller.carts[index]));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text("Total products: ",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black)),

                                              Text(controller.carts[index].totalProducts.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Text("Id: ",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black)),

                                              Text(controller.carts[index].id.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Text("Total: ",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black)),

                                              Text(controller.carts[index].total.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Text("UserId: ",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.black)),

                                              Text(controller.carts[index].userId.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ]),
                        ),
                        Visibility(
                          visible: controller.cartLoading,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))),
    ));
  }
}

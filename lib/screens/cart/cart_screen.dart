import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/screens/addresses/address_screen.dart';
import 'package:amazon_clone/screens/productdetails/productdetailservice.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/screens/search_res/searchres.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';

class cartpage extends StatefulWidget {
  const cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  void navigateTosearch(String search) {
    Navigator.pushNamed(context, searchres.routeName, arguments: search);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchquery = TextEditingController();
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    ProductDetailsServices productDetailsServices = new ProductDetailsServices();
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 29, 201, 192),
                  Color.fromARGB(255, 125, 221, 216),
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateTosearch,
                      controller: searchquery,
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(
                            right: 6,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: "Search Amazon.in",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 20),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sub Total : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "₹ $sum",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                ],
              ),
            ),
            (sum < 1000)
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Delivery Charges May Apply",
                      style: TextStyle(
                          fontSize: 17, color: Colors.lightBlueAccent),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Eligible for Free Delivery",
                      style: TextStyle(
                          fontSize: 17, color: Colors.lightBlueAccent),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.yellow,
                      Colors.yellow,
                      Colors.yellow,
                      Colors.yellowAccent
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, address_set.routeName);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Proceed To Buy (${user.cart.length})',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            ListView.builder(
                itemCount: user.cart.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final productCart =
                      context.watch<UserProvider>().user.cart[index];
                  final product = Product.fromMap(productCart['product']);
                  final quantity = productCart['quantity'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: InkWell(
                      onTap: () {
                        //navigateToproduct(products![index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 120.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(product.images[0]),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black12,
                                        ),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                productDetailsServices.removefromcart(context: context, product: product);
                                              },
                                              child: Container(
                                                width: 35,
                                                height: 32,
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1.5),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Container(
                                                width: 35,
                                                height: 32,
                                                alignment: Alignment.center,
                                                child: Text(
                                                    quantity.toString(),
                                                    ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                productDetailsServices.addToCart(context: context, product: product);
                                              },
                                              child: Container(
                                                width: 35,
                                                height: 32,
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "MRP :",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "₹" + product.price.toString(),
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  (product.price > 1000)
                                      ? Text(
                                          "Eligible For Free Delivery",
                                          style: const TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.w300),
                                        )
                                      : Text(
                                          "Delivery charges may apply",
                                          style: const TextStyle(
                                              fontSize: 13.0,
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.w300),
                                        ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "In Stock",
                                    style: const TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

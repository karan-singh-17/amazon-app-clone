import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/screens/addresses/address_services.dart';
import 'package:amazon_clone/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/products.dart';

class finalorder extends StatefulWidget {
  String address;
  finalorder({required this.address});
  static const String routeName = "/finalorder";

  @override
  State<finalorder> createState() => _finalorderState();
}

class _finalorderState extends State<finalorder> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    AddressServices addressServices = new AddressServices();
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient:  LinearGradient(
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
              Container(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Text("Place Order"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("Order Summary" , style: TextStyle(
                      fontSize: 20 , letterSpacing: 3 , wordSpacing: 3
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                          style: BorderStyle.solid
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping Address : " ) ,
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(widget.address,maxLines: 5, softWrap: true,
                              overflow: TextOverflow.ellipsis , style: TextStyle(fontSize: 13),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Items : " ) ,
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(user.cart.length.toString(),maxLines: 5, softWrap: true,
                                overflow: TextOverflow.ellipsis , style: TextStyle(fontSize: 15),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height : 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sub Total : ₹ " ) ,
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(sum.toString(),maxLines: 5, softWrap: true,
                                overflow: TextOverflow.ellipsis , style: TextStyle(fontSize: 16),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        children: [
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
                                  padding: const EdgeInsets.only(bottom: 6),
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
                                              width: 100.0,
                                              height: 120.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8.0),
                                                image: DecorationImage(
                                                  image: NetworkImage(product.images[0]),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 20.0),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                "MRP :",
                                                style: TextStyle(fontSize: 8),
                                              ),
                                              Text(
                                                "₹" + product.price.toString(),
                                                style: const TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text("Qty. \n" , style: TextStyle(fontSize: 7),),
                                              Text(quantity.toString())
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.orangeAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    addressServices.placeOrder(context: context, address: widget.address, totalSum: sum.toDouble());
                    Navigator.pushNamedAndRemoveUntil(context, bottom_bar.routeName , (route)=>false);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 3.0,
                      wordSpacing: 2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

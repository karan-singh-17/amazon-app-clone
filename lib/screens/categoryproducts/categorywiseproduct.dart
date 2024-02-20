import 'package:amazon_clone/screens/categoryproducts/categoryservices.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/screens/productdetails/prouctdetails.dart';


import '../../models/products.dart';

class categorywiseproduct extends StatefulWidget {
  static const String routeName = '/categorywise';
  final String categoryName;
  const categorywiseproduct({super.key , required this.categoryName});

  @override
  State<categorywiseproduct> createState() => _categorywiseproductState();
}

class _categorywiseproductState extends State<categorywiseproduct> {
  final categoryservices categoryServices = categoryservices();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchcategoryproduct();
  }

  fetchcategoryproduct() async{
    products = await categoryServices.fetchcategoryproduct(context, widget.categoryName);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return products == null ? Scaffold(
      body: Center(
        child: Text("No Products Available" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
      ),
    ) :Scaffold(
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
                    Text("${widget.categoryName}"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: products!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context , index){
                final productData = products![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, productdetails.routeName , arguments: productData);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300, // Set border color to very light grey
                          width: 0.5, // Set border width
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          // Left side - Image
                          Container(
                            width: 120.0, // Adjust the width according to your needs
                            height: 240.0, // Adjust the height according to your needs
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(productData.images[0]),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),

                          // Right side - Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top Section - Name with Overflow Ellipsis
                                Text(
                                  productData.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                // Bottom Section - Price
                                Text("MRP :" , style: TextStyle(fontSize: 13),),
                                Text(
                                  "₹" + productData.price.toString(),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  width: 150.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.orange, Colors.orangeAccent],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {

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
                                    child: Text(
                                      'ADD TO CART',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  width: 150.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.orange, Colors.orangeAccent],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {

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
                                    child: Text(
                                      'B u y    N o w ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}

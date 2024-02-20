import 'package:amazon_clone/screens/productdetails/productdetailservice.dart';
import 'package:amazon_clone/screens/productdetails/prouctdetails.dart';
import 'package:amazon_clone/screens/search_res/services/searchservice.dart';
import 'package:flutter/material.dart';
import '../../models/products.dart';

class searchres extends StatefulWidget {
  static const String routeName = '/searchres';
  final String searchquery;
  searchres({super.key, required this.searchquery});

  @override
  State<searchres> createState() => _searchresState();
}

class _searchresState extends State<searchres> {
  final searchservices searchServices = searchservices();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchproduct();
  }
  fetchproduct() async{
    products = await searchServices.fetchsearchproduct(context, widget.searchquery);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    ProductDetailsServices productService = new ProductDetailsServices();
    void navigateTosearch(String search){
      Navigator.pushNamed(context, searchres.routeName , arguments: search);
    }
    void navigateToproduct(Product product){
      Navigator.pushNamed(context, productdetails.routeName , arguments: product);
    }
    return products == null ? Scaffold(
      body: Center(
        child: Text("No Products Available" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
      ),
    ) :
      Scaffold(
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
                  margin: const EdgeInsets.only(left: 1),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateTosearch,
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(
                            left: 6,
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
                        hintText: widget.searchquery,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                          navigateToproduct(products![index]);
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
                              Container(
                                width: 120.0,
                                height: 240.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(productData.images[0]),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productData.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    const Text("MRP :" , style: TextStyle(fontSize: 13),),
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
                                    gradient: const LinearGradient(
                                      colors: [Colors.orange, Colors.orangeAccent],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      productService.addToCart(context: context, product: products![index]);
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
                                      'ADD TO CART',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                    const SizedBox(height: 10,),
                                    Container(
                                      width: 150.0,
                                      height: 40.0,
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

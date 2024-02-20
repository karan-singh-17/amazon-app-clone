import 'package:amazon_clone/models/products.dart';
import 'package:amazon_clone/screens/home/widgets/rowunderdeliv.dart';
import 'package:amazon_clone/screens/productdetails/productdetailservice.dart';
import 'package:amazon_clone/screens/search_res/searchres.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class productdetails extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const productdetails({super.key, required this.product});

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  ProductDetailsServices productservice = new ProductDetailsServices();
  void navigateTosearch(String search) {
    Navigator.pushNamed(context, searchres.routeName, arguments: search);
  }
  bool isExpanded = false;
  List<Map<String, String>> featuresImages = [
    {
      'title': 'Assured',
      'image': 'lib/assets/assured.png',
    },
    {
      'title': 'New',
      'image': 'lib/assets/new.png',
    },
    {
      'title': 'Cash On \n Delivery',
      'image': 'lib/assets/cashon.png',
    },
    {
      'title': 'Customer \n Favorite',
      'image': 'lib/assets/liked.png',
    },
    {
      'title': 'Customer \n Service',
      'image': 'lib/assets/service.png',
    },
    {
      'title': 'In Stock',
      'image': 'lib/assets/instock.png',
    },
    {
      'title': 'Discounted',
      'image': 'lib/assets/discount.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController searchquery = TextEditingController();

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
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(widget.product.id.toString()),
                  ))
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 5.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2.0,
                        wordSpacing: 2.0,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10 , bottom: 10),
                    color: Colors.grey.shade100,
                    child: CarouselSlider(
                      items: widget.product.images.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) => Image.network(
                              i,
                              fit: BoxFit.cover,
                              height: 290,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        animateToClosest: true,
                        viewportFraction: 1,
                        height: 290,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                color: Colors.grey.shade50,
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10 , top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("MRP : "  , style: TextStyle(fontSize: 15),),
                  Text("₹ " + widget.product.price.toString() , style: TextStyle(
                    fontSize: 25
                  ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange,Colors.orangeAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ElevatedButton(
                          onPressed:() => productservice.addToCart(context: context, product: widget.product),
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
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange,Colors.orangeAccent],
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
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 90,
              child: ListView.builder(
                  itemCount: featuresImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              featuresImages[index]['image']!,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          featuresImages[index]['title']!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),

            Container(
              color: Colors.grey.shade50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      child: AnimatedCrossFade(
                        duration: Duration(milliseconds: 300),
                        firstChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 25 , fontWeight: FontWeight.w500
                                  ),
                                ),
                                Icon(Icons.arrow_circle_up_rounded , size: 30,),
                              ],
                            ),
                            Text(
                              widget.product.description,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        secondChild: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 25 , fontWeight: FontWeight.w500
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down_circle_outlined , size: 30,),
                              ],
                            ),
                            Text(widget.product.description , softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                        crossFadeState:
                        isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      ),


                    ),
                  )


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

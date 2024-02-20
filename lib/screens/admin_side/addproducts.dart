import 'dart:io';

import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/screens/admin_side/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class addproducts extends StatefulWidget {
  static const String routeName = '/add-product';
  const addproducts({super.key});

  @override
  State<addproducts> createState() => _addproductsState();
}

class _addproductsState extends State<addproducts> {
  String category = 'Mobiles';
  TextEditingController productname_cont = TextEditingController();
  TextEditingController desc_cont = TextEditingController();
  TextEditingController price_cont = TextEditingController();
  TextEditingController quantity_cont = TextEditingController();
  AdminServices adminServices = AdminServices();
  List<File> images = [];
  List<String> productcategory = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  void sellProduct(){
    if(productname_cont.text.isNotEmpty && desc_cont.text.isNotEmpty
    && price_cont.text.isNotEmpty && quantity_cont.text.isNotEmpty && images.isNotEmpty){
      adminServices.sellProduct(context: context,
          name:productname_cont.text,
          description: desc_cont.text,
          price: double.parse(price_cont.text),
          quantity: double.parse(quantity_cont.text),
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
            title: Text(
              "ADD PRODUCT",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            images.isNotEmpty
                ? CarouselSlider(
                    items: images.map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) => Image.file(
                            i,
                            fit: BoxFit.cover,
                            height: 300,
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 200,
                    ),
                  )
                : GestureDetector(
                    onTap: selectImages,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo),
                          Text('Add Product Images'),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: productname_cont,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Product Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: desc_cont,
                maxLines: 7,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Description',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: price_cont,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Price',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: quantity_cont,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Quantity',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productcategory.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      sellProduct();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 20),
                    width: 170,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "SELL",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

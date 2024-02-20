import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/screens/admin_side/services/admin_services.dart';
import 'package:amazon_clone/screens/order_details/orderdetails.dart';
import 'package:flutter/material.dart';

import '../../widgets/product_tile.dart';

class admincart extends StatefulWidget {
  const admincart({super.key});

  @override
  State<admincart> createState() => _admincartState();
}

class _admincartState extends State<admincart> {
  final AdminServices adminServices = AdminServices();
  List<Order>? orders;

  @override
  void initState() {
    super.initState();
    fetchallorder();
  }
  fetchallorder() async{
    orders = await adminServices.fetchallorders(context);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
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
                alignment: Alignment.topLeft,
                child: Image.asset('lib/assets/amazon_in.png' , width: 120, height: 45, color: Colors.black, ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Text("Admin" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w700)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: GridView.builder(
          itemCount: orders!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context , index){
            final productData = orders![index];
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, order_details.routeName , arguments: orders![index]);
                  },
                  child: Container(
                    height: 160,
                      width: 180,
                      child: product_tile(image: productData.products[0].images[0])),
                ),
              ],
            );
          }),
    );
  }
}

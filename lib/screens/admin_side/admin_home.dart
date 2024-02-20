import 'package:amazon_clone/screens/admin_side/addproducts.dart';
import 'package:amazon_clone/screens/admin_side/services/admin_services.dart';
import 'package:amazon_clone/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/products.dart';
import '../../provider/user_provider.dart';

class adminscreen extends StatefulWidget {
  const adminscreen({super.key});

  @override
  State<adminscreen> createState() => _adminscreenState();
}

class _adminscreenState extends State<adminscreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchallproduct();
  }
  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      fetchallproduct();
    });
  }

  fetchallproduct() async{
    products = await adminServices.fetchallproduct(context);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return products == null ? Scaffold(
      body: Center(
        child: Text("LOADING....."),
      ),
    ) : Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: products!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context , index){
              final productData = products![index];
              return Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: product_tile(image: productData.images[0]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text(productData.name , overflow: TextOverflow.ellipsis , maxLines: 2,)),
                      Text(productData.price.toString() , style: TextStyle(fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){
        
                      }, icon: Icon(Icons.delete)),
                    ],
                  ),
                ],
              );
              }),
        ),
      ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        elevation: 2,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, addproducts.routeName);
        },
      ),
    );
  }
}

import 'package:amazon_clone/screens/order_details/orderdetails.dart';
import 'package:amazon_clone/screens/profile/profileservices.dart';
import 'package:amazon_clone/widgets/profile_btns.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/widgets/below_app_bar_accounts.dart';
import 'package:provider/provider.dart';

import '../../models/order.dart';
import '../../provider/user_provider.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  List<Order>? orders;
  final ProfileServices profileServices = ProfileServices();
  void fetchOrders() async {
    orders = await profileServices.fetchMyOrders(context: context);
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    fetchOrders();
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
                    IconButton(
                        onPressed: (){
                          },
                        icon: Icon(Icons.notifications),
                    ),
                    IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: (orders == null) ? Center(
        child: Text("Orders will be shown here"),
      ):Column(
        children: [
          const belowappbar(),
          const SizedBox(height : 10,),
          Row(
            children: [
              profilebtns(
                  text: 'Settings',
                  onTap: (){
                  }),
              profilebtns(
                  text: 'Become a Seller',
                  onTap: (){
                  }),
            ],
          ),
          const SizedBox(height : 10 ,),
          Row(
            children: [
              profilebtns(
                  text: 'LogOut',
                  onTap: (){
                    profileServices.logOut(context);
                  }),
              profilebtns(
                  text: 'Your Wishlist',
                  onTap: (){
                  }),
            ],
          ),
          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text("Your Orders" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              height: 170,
              padding: const EdgeInsets.only(
                left: 10 ,
                right: 20 ,
                bottom : 10,
              ),
              child : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 4.0, // Spacing between columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                  ),
                  itemCount :  orders!.length,
                  itemBuilder: (context , index){
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, order_details.routeName , arguments: orders![index]);
                      },
                      child: Container(
                        height: 150,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.black
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(orders![index].products[0].images[0] , fit: BoxFit.fitHeight , ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

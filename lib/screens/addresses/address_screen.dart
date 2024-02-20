import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/screens/addresses/address_services.dart';
import 'package:amazon_clone/screens/finalorder/finalorder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class address_set extends StatefulWidget {
  const address_set({super.key});
  static const String routeName = "/address";
  @override
  State<address_set> createState() => _address_setState();
}

class _address_setState extends State<address_set> {
  TextEditingController houseno_controller = TextEditingController();
  TextEditingController area_controller = TextEditingController();
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController city_controller = TextEditingController();

  AddressServices addressServices = new AddressServices();
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: Text("Select Address"),
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
        ),
      ),
      body: (user.address.isEmpty) ? Padding(
        padding: const EdgeInsets.only(left: 18.0 , right: 18.0 , top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: houseno_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Flat , House No. , Building',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: area_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Area , Street',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: pincode_controller,
                  
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pincode',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: city_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Town/City , State',
                  ),
                ),
              ),
              SizedBox(height: 80,),
              Container(
                width: 250.0,
                height: 60.0,
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
                    if(city_controller.text.isNotEmpty && area_controller.text.isNotEmpty
                        && pincode_controller.text.isNotEmpty && houseno_controller.text.isNotEmpty){
          
                      String address = "${houseno_controller.text},${area_controller.text},${pincode_controller.text},${city_controller.text}";
                        addressServices.saveUserAddress(context: context, address: address);
                      Navigator.pushNamed(context, finalorder.routeName , arguments: address);
                    }else{
                      showSnackBar(context, "Enter all details");
                    }
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
                    'Next',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ) : Padding(
        padding: const EdgeInsets.only(left: 18.0 , right: 18 , top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, finalorder.routeName , arguments: user.address);
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(user.address , maxLines: 1, softWrap: true, style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Text("OR" , style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: houseno_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Flat , House No. , Building',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: area_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Area , Street',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: pincode_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pincode',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: city_controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Town/City , State',
                  ),
                ),
              ),
              SizedBox(height: 30,),
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
                    if(city_controller.text.isNotEmpty && area_controller.text.isNotEmpty
                    && pincode_controller.text.isNotEmpty && houseno_controller.text.isNotEmpty){
                      String address = "${houseno_controller.text} , ${area_controller.text} , ${pincode_controller.text} , ${city_controller.text}";
                      addressServices.saveUserAddress(context: context, address: address);
                      Navigator.pushNamed(context, finalorder.routeName , arguments: address);
                    }else{
                      showSnackBar(context, "Enter all details");
                    }
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
                    'Next',
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
      ),

    );
  }
}

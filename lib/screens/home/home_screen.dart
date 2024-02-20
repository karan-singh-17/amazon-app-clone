import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/screens/home/widgets/carouselscrolls.dart';
import 'package:amazon_clone/screens/home/widgets/deals.dart';
import 'package:amazon_clone/screens/home/widgets/rowunderdeliv.dart';
import 'package:amazon_clone/screens/home/widgets/under_app_bar.dart';
import 'package:amazon_clone/screens/search_res/searchres.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  void navigateTosearch(String search){
    Navigator.pushNamed(context, searchres.routeName , arguments: search);
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
            homeunderbar(),
            SizedBox(height: 10,),
            underdelivrow(),
            SizedBox(height : 10 ,),
            carouselscrolls(),
            deals(),
          ],
        ),
      ),

      /*body: Center(
        child: Text(
          user.toJson(),
        ),
      ),*/
    );
  }
}

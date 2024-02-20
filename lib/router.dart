import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/products.dart';
import 'package:amazon_clone/screens/addresses/address_screen.dart';
import 'package:amazon_clone/screens/admin_side/addproducts.dart';
import 'package:amazon_clone/screens/admin_side/adminbottom.dart';
import 'package:amazon_clone/screens/categoryproducts/categorywiseproduct.dart';
import 'package:amazon_clone/screens/finalorder/finalorder.dart';
import 'package:amazon_clone/screens/order_details/orderdetails.dart';
import 'package:amazon_clone/screens/productdetails/prouctdetails.dart';
import 'package:amazon_clone/screens/register.dart';
import 'package:amazon_clone/screens/home/home_screen.dart';
import 'package:amazon_clone/screens/search_res/searchres.dart';
import 'package:amazon_clone/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'screens/auth.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case auth.routeName :
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const auth(),
      );
    case register.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const register(),
      );
    case HomeScreen.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case bottom_bar.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const bottom_bar(),
      );
    case adminbottom.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const adminbottom(),
      );
    case addproducts.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const addproducts(),
      );
    case address_set.routeName :
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const address_set(),
      );
    case categorywiseproduct.routeName :
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => categorywiseproduct(
          categoryName: category,
        ),
      );
    case searchres.routeName :
      var searchquery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => searchres(
          searchquery: searchquery,
        ),
      );
    case productdetails.routeName :
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => productdetails(
          product: product,
        ),
      );
    case finalorder.routeName :
      var address = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => finalorder(
          address : address,
        ),
      );
    case order_details.routeName :
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => order_details(
          order: order,
        ),
      );
    default: return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Icon(Icons.error , size: 20),
        ),
      ),
    );
  }
}
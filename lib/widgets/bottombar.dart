import 'package:amazon_clone/screens/cart/cart_screen.dart';
import 'package:amazon_clone/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import '../screens/home/home_Screen.dart';

class bottom_bar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const bottom_bar({super.key});

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const HomeScreen(),
    const profilepage(),
    const cartpage(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.5,
        enableFeedback: false,
        currentIndex: _page,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? Colors.teal
                        : Colors.white,
                    width: 3,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_sharp,
                size: 30,
              ),
            ),
            label: '',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? Colors.teal
                        : Colors.white,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
            label: '',
          ),
          // CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? Colors.teal
                        : Colors.white,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

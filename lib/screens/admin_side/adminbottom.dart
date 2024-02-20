import 'package:amazon_clone/screens/admin_side/admin_cart.dart';
import 'package:amazon_clone/screens/admin_side/admin_home.dart';
import 'package:flutter/material.dart';

class adminbottom extends StatefulWidget {
  static const String routeName = '/admin-actual-home';
  const adminbottom ({super.key});

  @override
  State<adminbottom> createState() => adminbottomState();
}

class adminbottomState extends State<adminbottom> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 3;

  List<Widget> pages = [
    const adminscreen(),
    const admincart(),
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
                Icons.reorder,
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

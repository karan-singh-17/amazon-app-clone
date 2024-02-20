
import 'package:amazon_clone/screens/register.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class auth extends StatefulWidget {
  const auth({super.key});
  static const String routeName = '/auth-screen';

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final AuthService authService = AuthService();

  void signInUser(){
    authService.signInUser(
        context: context,
        email: email_controller.text,
        password: password_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 80,
        actions : [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      image: const NetworkImage(
                          'https://freelogopng.com/images/all_img/1688364164amazon-logo-transparent.png')),
                SizedBox(width: 80,),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.teal,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Text("L O G I N" , style: TextStyle( fontSize: 40 , fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 80,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: email_controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'E - M A I L',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: password_controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    signInUser();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Background color
                    onPrimary: Colors.white, // Text color
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 1.0,
                  ),
                  child: Text('L O G I N', style: TextStyle(fontSize: 20.0)),
                ),
                SizedBox(height: 100,),
            
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, register.routeName);
                  },
                  child: Text(
                    "NOT A USER? REGISTER NOW",
                    style: TextStyle(fontSize: 18 , color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class register extends StatefulWidget {
  const register({super.key});
  static const String routeName = '/register-screen';

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  final AuthService authService = AuthService();

  void signUpUser(){
    authService.signUpUser(
        context: context,
        email: email_controller.text,
        username: username_controller.text,
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Text("R E G I S T E R" , style: TextStyle( fontSize: 40 , fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 80,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                    controller: username_controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'USERNAME',
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
                      hintText: 'PASSWORD',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    signUpUser();
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
                  child: Text('R E G I S T E R', style: TextStyle(fontSize: 20.0)),
                ),
                SizedBox(height: 40,),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}

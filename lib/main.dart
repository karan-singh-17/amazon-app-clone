
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/screens/admin_side/admin_home.dart';
import 'package:amazon_clone/screens/admin_side/adminbottom.dart';
import 'package:amazon_clone/screens/auth.dart';
import 'package:amazon_clone/screens/home/home_Screen.dart';
import 'package:amazon_clone/services/auth_service.dart';
import 'package:amazon_clone/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider( providers : [
    ChangeNotifierProvider(
        create: (context) => UserProvider(),
    ),
  ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState(){
    super.initState();
    authService.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: (settings) => generateRoute(settings),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ?
      Provider.of<UserProvider>(context).user.type == 'user' ?
      const bottom_bar() : const adminbottom() : const auth(),

      /*Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, auth.routeName);
                    },
                    icon: Icon(Icons.access_alarm));
              }
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),*/
    );
  }
}

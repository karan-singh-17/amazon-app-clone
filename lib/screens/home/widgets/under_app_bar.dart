import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class homeunderbar extends StatelessWidget {
  const homeunderbar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 29, 201, 192).withOpacity(0.6),
            Color.fromARGB(255, 125, 221, 216).withOpacity(0.6),
          ],
          stops: [0.5, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.location_on),
          Container(
            width: 300,
            alignment: Alignment.centerLeft,
            child: Text('Delivery to  ' + user.name.toString() + '  -  ' + user.address.toString() ,
              maxLines: 1, softWrap: true, overflow:TextOverflow.ellipsis ,
              style: TextStyle(fontSize: 13), ),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

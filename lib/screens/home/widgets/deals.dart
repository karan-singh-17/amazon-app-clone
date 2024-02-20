import 'package:flutter/material.dart';

class deals extends StatefulWidget {
  const deals({super.key});

  @override
  State<deals> createState() => _dealsState();
}

class _dealsState extends State<deals> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left : 10 , top: 10),
          alignment: Alignment.centerLeft,
          child: Text('Deal Of The Day' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network('https://bgr.com/wp-content/uploads/2021/05/amazon-sign.jpg?quality=82&strip=all&w=1020&h=574&crop=1' ,
          fit: BoxFit.fill),
        ),
        Container(
          padding: EdgeInsets.only(top: 5 , left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            "Rs. 1000" , style: TextStyle( fontSize: 20),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5 , left: 10 , right: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            "Amazon Voucher for everyone jiuhbjiuhbjnkjihusbdgnsadjihufbjsndjfihj" ,
            style: TextStyle( fontSize: 15 ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),

      ],
    );
  }
}

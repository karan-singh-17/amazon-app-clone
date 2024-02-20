import 'dart:convert';

import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/utils.dart';
import '../../../models/products.dart';


class searchservices{
  String uri = 'http://192.168.1.121:3000';

  Future<List<Product>> fetchsearchproduct(BuildContext context , String search) async {
    final userProvider = Provider.of<UserProvider>(context , listen: false);
    List<Product> productlist = [];
    try{
      http.Response res = await http.get(Uri.parse('$uri/api/products/search?search=$search') ,
        headers:
        {'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(response: res, context: context, onSuccess: (){
        for(int i = 0 ; i < jsonDecode(res.body).length ;i++ ){
          productlist.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              )
          );
        }
      });
    }catch (e){
      showSnackBar(context, e.toString());
    }
    return productlist;
  }
}
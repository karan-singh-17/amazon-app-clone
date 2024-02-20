import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/products.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  String uri = 'http://192.168.1.121:3000';

  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context , listen: false);
    try {
      final cloudinary = CloudinaryPublic('dmjkplb5o','il8vy6me');
      List<String> imageUrls = [];
      for(int i = 0 ; i < images.length ; i++){
        CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path , folder: name)
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
      
      http.Response res = await http.post(Uri.parse('$uri/admin/add-product') , headers:{
        'Content-Type' : 'application/json; charset=UTF-8' ,
        'x-auth-token' : userProvider.user.token!,
      },
      body: product.toJson());

      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, 'Product added successfully');
        Navigator.pop(context);
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchallproduct(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context , listen: false);
    List<Product> productlist = [];
    try{
      http.Response res = await http.get(Uri.parse('$uri/admin/get-product') ,
          headers:
          {'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token!,
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
  Future<List<Order>> fetchallorders(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context , listen: false);
    List<Order> orderlist = [];
    try{
      http.Response res = await http.get(Uri.parse('$uri/admin/all-orders') ,
        headers:
        {'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token!,
        },
      );
      httpErrorHandle(response: res, context: context, onSuccess: (){
        for(int i = 0 ; i < jsonDecode(res.body).length ;i++ ){
          orderlist.add(
              Order.fromJson(
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
    return orderlist;
  }
  void changeOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/change-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

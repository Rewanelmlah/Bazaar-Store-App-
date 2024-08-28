
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
class Api{
  //get request
  Future<dynamic> get({required String url,@required String? token})async{
    Map<String,String> headers ={};
    if(token !=null){
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response= await http.get(Uri.parse(url),headers: headers,);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('there is a problem with status code ${response.statusCode}');
    }
  }
  //post request
  Future<dynamic> post({required String url,@required dynamic body,@required String? token})async{
    Map<String,String> headers ={};
    if(token !=null){
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response= await http.post(Uri.parse(url),body:body,headers: headers, );
   if(response.statusCode==200){
    Map<String,dynamic>data=jsonDecode(response.body);
    return data;
   }else{
     throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
   }
  }
  //put request
  Future<dynamic> put(
      {required String url,
        @required dynamic body,
        @required String? token}) async {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }

    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There was a problem with Status Code ${response.statusCode}.');
    }
  }
}
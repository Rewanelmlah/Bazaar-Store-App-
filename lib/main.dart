import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';
import 'package:store_app/services/update_product.dart';

void main() {
  runApp( StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context)=>HomePage(),
        UpdateProductPage.id:(context)=>UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}


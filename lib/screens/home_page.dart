import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custome_card.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String id ='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff7F508D),elevation: 0,
      actions: [
        IconButton(onPressed: (){},icon: Icon(FontAwesomeIcons.cartPlus,color: Colors.white,),)
      ],
      title: Text('Bazaar',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold) ,),
     
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top:90),
        child:FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              List<ProductModel>products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100
                  ),
                  itemBuilder: (context, index) {
                    return CustomeCard(product: products[index],);
                  });
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          }),
      ),
    );
  }
}

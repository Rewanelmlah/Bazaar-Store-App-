import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import '../widgets/custombotton.dart';
import '../widgets/customtextfeild.dart';
import '../widgets/show_snack_par.dart';
class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({super.key});
static String id= 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
String? productName, desc,image;

String?price;

bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff7F508D),
          title: Text('Update product',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 160,),
                CustomeTextFeild(
                  onChanged: (data){
                    productName=data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(height: 15,),
                CustomeTextFeild(
                  onChanged: (data){
                    desc=data;
                  },
                  hintText: 'Description',
                ),
                SizedBox(height: 15,),
                CustomeTextFeild(
                  inputType: TextInputType.number,
                  onChanged: (data){
                    price=data;
                  },
                  hintText: 'Price',
                ),
                SizedBox(height: 15,),
                CustomeTextFeild(
                  onChanged: (data){
                    image=data;
                  },
                  hintText: 'Image',
                ), SizedBox(height: 30,),
                CustomeButton( text: 'Update',
                  onTap: ()async{
                    isLoading=true;
                    setState(() {

                    });

                    try {
                     await updateProduct(product);
                      showSnackBar(context, 'The Product Updates Successfully.');
                    }  catch (e) {
                     // showSnackBar(context, 'Oops, There was an error : ($e).');
                        print(e);
                    }
                    isLoading=false;
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> updateProduct(ProductModel product)async {
     await UpdateProductService().updateProduct(title: productName==null ?product.title:productName!,
      price: price==null ?product.price.toString():price!,
       desc: desc==null ?product.description:desc!,
      image: image==null ?product.image:image!,
      category:product.category,
     id: product.id,
     );

  }
}





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:watches_hub/Widgets/snackBar.dart';

class ProductServices {
  final FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<void>addProduct(String productName,String productPrice,String productDesc,String image,String brand,BuildContext context)async{
    try{
      Map<String,dynamic> data ={
        "Name":productName,
        "Price":productPrice,
        "Desc":productDesc,
        "image": image,
        "Brand":brand,
      };
      await firestore.collection("Products").add(data);
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
  Future<void>updateProduct(String id,String productName,String productPrice,String productDesc,String image,String brand,BuildContext context)async{
    try{
      Map<String,dynamic> data ={
        "Name":productName,
        "Price":productPrice,
        "Desc":productDesc,
        "image": image,
        "Brand":brand,
      };
      await firestore.collection("Products").doc(id).set(data);
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
  Future<void>deleteProduct(String id,BuildContext context)async{
    try{
      await firestore.collection("Products").doc(id).delete();
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

}
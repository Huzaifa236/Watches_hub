



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:watches_hub/Widgets/snackBar.dart';

class ProductServices {
  final FirebaseFirestore firestore =FirebaseFirestore.instance;
  final FirebaseStorage storage =FirebaseStorage.instance;
  Future<void>addProduct(String productName,String productPrice,String productDesc,File image,String brand,BuildContext context)async{
    try{
      print("Uploading...");
      UploadTask uploadTask = storage.ref("Products").putFile(image);
      print("object");
      TaskSnapshot taskSnapshot =  uploadTask.snapshot;
      String url = await taskSnapshot.ref.getDownloadURL();
      if(url.isNotEmpty){
        Map<String,dynamic> data ={
          "Name":productName,
          "Price":productPrice,
          "Desc":productDesc,
          "image": url,
          "Brand":brand,
        };
        await firestore.collection("Products").add(data);
        Navigator.pop(context);
        showSnackBar(context, "Product Uploaded Successfully");
      }else{
        showSnackBar(context, "Image not Uploaded");
      }
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
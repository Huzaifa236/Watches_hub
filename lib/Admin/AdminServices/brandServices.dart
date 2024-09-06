



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:watches_hub/Widgets/snackBar.dart';

class BrandServices {
  final FirebaseFirestore firestore =FirebaseFirestore.instance;

  Future<void>addBrand(String brandName,BuildContext context)async{
    try{
      Map<String,dynamic> data ={
        "Brand":brandName,
      };
     await firestore.collection("Brands").add(data);
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
  Future<void>updateBrand(String id,String brandName,BuildContext context)async{
    try{
      Map<String,dynamic> data ={
        "id":id,
        "Brand":brandName,
      };
     await firestore.collection("Brands").doc(id).set(data);
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
  Future<void>deleteBrand(String id,BuildContext context)async{
    try{
     await firestore.collection("Brands").doc(id).delete();
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

}
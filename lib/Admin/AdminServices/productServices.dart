



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:watches_hub/Widgets/snackBar.dart';

import '../../Constants/app_colors.dart';

class ProductServices {
  final FirebaseFirestore firestore =FirebaseFirestore.instance;
  final FirebaseStorage storage =FirebaseStorage.instance;
  Future<void> addProduct(
      String productName,
      String productPrice,
      String productDesc,
      String productQuantity,
      File image,
      Uint8List webImage,
      String brand,
      BuildContext context
      ) async
  {
    try {
      if (kIsWeb) {
        UploadTask uploadTask = FirebaseStorage.instance.ref().child(
            'ProductImage').child(productName).putData(webImage);
        TaskSnapshot taskSnapshot = await uploadTask;
        String productImage = await taskSnapshot.ref.getDownloadURL();
        addData(productName,productPrice,productDesc,productQuantity,productImage,brand,context);

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product Added Successfully')));
      }
      else {
        UploadTask uploadTask = FirebaseStorage.instance.ref().child(
            'ProductImage').child(productName).putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        String productImage = await taskSnapshot.ref.getDownloadURL();
        addData(productName,productPrice,productDesc,productQuantity,productImage,brand,context);
      }
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())));
    }
  }

  void addData(String productName,
      String productPrice,
      String productDesc,
      String productQuantity,
      String imageUrl,
      String brand,
      BuildContext context) async
  {
    await FirebaseFirestore.instance.collection('Products').add({
      'product_name': productName,
      'product_qty': int.parse(productQuantity),
      // 'product_desc': productDesc,
      'product_price': double.parse(productPrice),
      'product_image': imageUrl,
      'wish_list': false,
      'Brand': brand
    });
  }
  // Future<void> addProduct(
  //     String productName,
  //     String productPrice,
  //     String productDesc,
  //     File image,
  //     String brand,
  //     BuildContext context
  //     ) async {
  //   try {
  //     print("Uploading image...");
  //
  //     // Create a reference to the storage location
  //     final storageRef = FirebaseStorage.instance.ref().child('Products').child(productName);
  //     // Start the upload task
  //     final uploadTask = storageRef.putFile(image);
  //
  //     // Monitor the upload progress
  //     uploadTask.snapshotEvents.listen((event) {
  //       print("Upload progress: ${(event.bytesTransferred / event.totalBytes) * 100}%");
  //     });
  //     print("object");
  //     // Wait for the upload to complete
  //     final taskSnapshot = await uploadTask;
  //
  //     // Get the download URL
  //     final url = await taskSnapshot.ref.getDownloadURL();
  //
  //     // Check if URL is not empty
  //     if (url.isNotEmpty) {
  //       // Create the data to be added to Firestore
  //       final data = {
  //         "Name": productName,
  //         "Price": productPrice,
  //         "Desc": productDesc,
  //         "image": url,
  //         "Brand": brand,
  //       };
  //
  //       // Add the data to Firestore
  //       await FirebaseFirestore.instance.collection("Products").add(data);
  //
  //       // Pop the context and show success snackbar
  //       Navigator.pop(context);
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: AppColors.backgroundColor,
  //           content: const Text("Product Uploaded Successfully",style: TextStyle(color: Colors.black),)));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: AppColors.backgroundColor,
  //           content: const Text("Image URL is empty",style: TextStyle(color: Colors.black),)));
  //     }
  //   } catch (e) {
  //     // Print detailed error message
  //     print("Error uploading product: $e");
  //
  //     // Handle errors and show error snackbar
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: AppColors.backgroundColor,
  //         content: Text("Failed to upload product: $e",style: const TextStyle(color: Colors.black),)));
  //   }
  // }

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
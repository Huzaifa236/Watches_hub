import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widgets/snackBar.dart';

class AdminServices {
  final FirebaseAuth auth =FirebaseAuth.instance;
  final FirebaseFirestore firestore =FirebaseFirestore.instance;
  Future<void>addUser(String username, String email, String password,
      BuildContext context) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      String uid = userCredential.user?.uid ?? '';

      if (uid.isNotEmpty) {
        Map<String, dynamic> data = {
          "Uid": uid,
          "Username": username,
          "Email": email,
        };
        await firestore.collection("Users").doc(uid).set(data);
        if(context.mounted){
          showSnackBar(context, "User Added successfully");
        }
      } else {
        if(context.mounted){
          showSnackBar(context, "Failed to create account");
        }
      }
    } catch (e) {
      if(context.mounted){
        showSnackBar(context, e.toString());
      }
    }
  }

  Future<void> deleteData(String id,BuildContext context)async{
  try{
    await firestore.collection("Users").doc(id).delete();
  }catch(e){
    if(context.mounted){
      showSnackBar(context, e.toString());
    }
  }
  }
  Future<void> updateData(String username,String email,String id,BuildContext context)async{
  try{
    if (id.isNotEmpty) {
      Map<String, dynamic> data = {
        "Uid": id,
        "Username": username,
        "Email": email,
      };
      print(id);
      await firestore.collection("Users").doc(id).set(data,SetOptions(merge: true));
      if(context.mounted){
        showSnackBar(context, "User Updated successfully");
      }
    } else {
      if(context.mounted){
        showSnackBar(context, "Failed to update account");
      }
    }
  }catch(e){
    if(context.mounted){
      showSnackBar(context, e.toString());
    }
  }
  }
}
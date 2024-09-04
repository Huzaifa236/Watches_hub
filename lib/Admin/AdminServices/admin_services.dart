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
        showSnackBar(context, "User Added successfully");
      } else {
        showSnackBar(context, "Failed to create account");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}
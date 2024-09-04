import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Admin/admin_page.dart';
import 'package:watches_hub/Screens/Auth/login_screen.dart';
import 'package:watches_hub/Widgets/snackBar.dart';
import '../Screens/Home.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> login(
      String email, String password, BuildContext context) async {
    if(email== 'admin@gmail.com'&& password =="admin123"){
      try {
        auth.signInWithEmailAndPassword(email: email, password: password).whenComplete((){
          print("logged in");
        });
        showSnackBar(context, "Logged In Successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminPage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message ?? 'Login failed');
      } catch (e) {
        showSnackBar(context, 'An unexpected error occurred');
      }
    }else{
      try {
        auth.signInWithEmailAndPassword(email: email, password: password).whenComplete((){
          print("logged in");
        });
        showSnackBar(context, "Logged In Successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message ?? 'Login failed');
      } catch (e) {
        showSnackBar(context, 'An unexpected error occurred');
      }
    }
  }

  Future<void> signUp(String username, String email, String password,
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
        showSnackBar(context, "Account created successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        showSnackBar(context, "Failed to create account");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } catch (e) {
      showSnackBar(context, 'Logout failed');
    }
  }
  Future<void> forgetPassword(String email,BuildContext context)async{
    try {
      await auth.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Recovery Email Sent...');
    } catch (e) {
      showSnackBar(context, 'Logout failed');
    }
  }
}

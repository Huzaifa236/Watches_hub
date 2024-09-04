
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';
import 'package:watches_hub/Screens/Auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splash(){
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return const LoginScreen();
      }));
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/watch.png",height: 300,width: 300,),
            const Text("Watches Hub",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),)
          ],
        ),
      )
    );
  }
}

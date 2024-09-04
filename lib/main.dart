import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Admin/admin_page.dart';
import 'package:watches_hub/Screens/Auth/login_screen.dart';
import 'package:watches_hub/Screens/Home.dart';

import 'Screens/Auth/splash_Screen.dart';
import 'Screens/profile_screen.dart';
import 'firebase_options.dart';

void main()async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const LoginScreen();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const HomeScreen();
        }));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Watches Hub",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        useMaterial3: true,
      ),
      home:const AdminPage(),
    );
  }
}


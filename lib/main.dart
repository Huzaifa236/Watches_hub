import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Admin/Pages/productPages/add_products.dart';
import 'Admin/Pages/brandPages/add_brands.dart';
import 'Admin/admin_page.dart';
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
  // checkLoggedIn(){
  //   FirebaseAuth.instance
  //       .authStateChanges()
  //       .listen((User? user) {
  //     if (user == null) {
  //       Navigator.push(context, MaterialPageRoute(builder: (context){
  //         return const LoginScreen();
  //       }));
  //     } else {
  //       Navigator.push(context, MaterialPageRoute(builder: (context){
  //         return const HomeScreen();
  //       }));
  //     }
  //   });
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   checkLoggedIn();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Watches Hub",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        useMaterial3: true,
      ),
      home:const AddProducts(),
    );
  }
}




import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Screens/brands_screen.dart';

import '../Constants/app_colors.dart';
import '../Screens/search_screen.dart';
import '../Services/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    // final FirebaseAuth auth =FirebaseAuth.instance;
    // getBrands(){
    //   FirebaseFirestore.instance
    //       .collection('Brands')
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       brandList.add(doc["Brand"]);
    //     });
    //   });
    // }
    return Drawer(
      width: 200,
      backgroundColor: AppColors.drawerBackgroud,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration:BoxDecoration(
                color: AppColors.buttonColor
            ),
            accountName: const Text("Ali"),
            accountEmail: const Text("Ali@gmail.com"),
            currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person,size: 30,)),
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.home_filled,color: Colors.white,),
            title: const Text("Home",style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const BrandsScreen();
              }));
            },
            leading: const Icon(Icons.add_shopping_cart,color: Colors.white,),
            title: const Text("Shop",style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SearchScreen();
              }));
            },
            leading: const Icon(Icons.search,color: Colors.white,),
            title: const Text("Search",style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.person,color: Colors.white,),
            title: const Text("Profile",style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){
              authController.logOut(context);
            },
            leading: const Icon(Icons.logout,color: Colors.white,),
            title: const Text("Logout",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
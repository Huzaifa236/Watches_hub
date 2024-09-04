

import 'package:flutter/material.dart';

import '../Constants/app_colors.dart';
import '../Services/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.authController,
  });

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
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
            onTap: (){},
            leading: const Icon(Icons.add_shopping_cart,color: Colors.white,),
            title: const Text("Shop",style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.settings,color: Colors.white,),
            title: const Text("Settings",style: TextStyle(color: Colors.white),),
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
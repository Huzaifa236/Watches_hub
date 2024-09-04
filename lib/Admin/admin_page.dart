

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Admin/Pages/orderPages/Orders.dart';
import 'package:watches_hub/Admin/Pages/reviewsPages/Reviews.dart';
import 'package:watches_hub/Admin/Pages/productPages/products.dart';
import 'package:watches_hub/Admin/Pages/users.dart';
import 'package:watches_hub/Constants/app_colors.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Welcome, Admin"),
        elevation: 2,
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const Users();
                  }));
                },
                child: SizedBox(
                  height: height*0.400,
                  width: width/2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: AppColors.drawerBackgroud,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,color: AppColors.backgroundColor,size: width*0.150,),
                        Text("Users",style: TextStyle(color: AppColors.backgroundColor,fontSize: 20 ),)
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const Products();
                  }));
                },
                child: SizedBox(
                  height: height*0.400,
                  width: width/2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: AppColors.drawerBackgroud,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.cart,color: AppColors.backgroundColor,size: width*0.150,),
                        Text("Products",style: TextStyle(color: AppColors.backgroundColor,fontSize: 20 ),)
                      ],
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const Reviews();
                  }));
                },
                child: SizedBox(
                  height: height*0.400,
                  width: width/2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: AppColors.drawerBackgroud,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: AppColors.backgroundColor,size: width*0.150,),
                        Text("Reviews",style: TextStyle(color: AppColors.backgroundColor,fontSize: 20 ),)
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const Orders();
                  }));
                },
                child: SizedBox(
                  height: height*0.400,
                  width: width/2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: AppColors.drawerBackgroud,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.badge,color: AppColors.backgroundColor,size: width*0.150,),
                        Text("Orders",style: TextStyle(color: AppColors.backgroundColor,fontSize: 20 ),)
                      ],
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

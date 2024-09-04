



import 'package:flutter/material.dart';
import 'package:watches_hub/Screens/update_screen.dart';
import 'package:watches_hub/Services/services.dart';
import 'package:watches_hub/Widgets/my_button.dart';
import 'package:watches_hub/Widgets/mydrawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController =AuthController();
    return Scaffold(
      drawer: MyDrawer(authController: authController),
      appBar: AppBar(),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://picsum.photos/id/91/200/300"),
            ),
            const SizedBox(
              child: Column(
                children: [
                  Text("Ali",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,letterSpacing:4)),
                  Text("Ali@gmail.com",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,letterSpacing:2)),
                ],
              ),
            ),
            MyButton(text: "Update Profile", onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const UpdateScreen();
              }));
            }),
          ],
        ),
      ),
    );
  }
}

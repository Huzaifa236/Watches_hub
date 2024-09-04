




import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';
import 'package:watches_hub/Services/auth_services.dart';
import 'package:watches_hub/Widgets/mydrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController =AuthController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      drawer: MyDrawer(authController: authController),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Our Products",style:TextStyle(color: Colors.black38,fontSize:25,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: CarouselView(
                  itemSnapping: false,
                  itemExtent: MediaQuery.of(context).size.width-40, children: [
                Image.network("https://picsum.photos/id/25/200/300",fit: BoxFit.cover,),
                Image.network("https://picsum.photos/id/26/200/300",fit: BoxFit.cover,),
                Image.network("https://picsum.photos/id/28/200/300",fit: BoxFit.cover,),
              ]),
            ),
            
          ],
        ),
      ),
    );
  }
}



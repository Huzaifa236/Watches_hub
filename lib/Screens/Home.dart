




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';
import 'package:watches_hub/Screens/product_detail_screen.dart';
import 'package:watches_hub/Services/auth_services.dart';
import 'package:watches_hub/Widgets/mydrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController =AuthController();
    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('Products').snapshots();

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
                Text("Our Store",style:TextStyle(color: Colors.black38,fontSize:25,fontWeight: FontWeight.bold),),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Our Products",style:TextStyle(color: Colors.black38,fontSize:25,fontWeight: FontWeight.bold),),
              ],
            ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _productStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
          
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.purple,));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text('No data available'));
              }
          
              return SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                    itemCount:snapshot.data!.docs.length ,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 2,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 10
                ), itemBuilder: (context,index){
                  var data = snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return  ProductDetailScreen(data: data,);
                      }));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(

                                    fit: BoxFit.cover,
                                  image:NetworkImage(data["product_image"],))
                              ),
                                height: 100,
                                width: 100,
                            ),
                            Center(child: Text(data["product_name"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black,fontSize: 25),)),
                            Text("Price: ${data['product_price']}",style: const TextStyle(color: Colors.black,fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
          ],
        ),
      ),
    );
  }
}



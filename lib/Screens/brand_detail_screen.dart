


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Screens/product_detail_screen.dart';

import '../Constants/app_colors.dart';

class BrandDetailScreen extends StatelessWidget {
  final dynamic data;
  const BrandDetailScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('Products').where("Brand",isEqualTo: data["Brand"]).snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text(data['Brand']),
      ),
      body: StreamBuilder<QuerySnapshot>(
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
    );
  }
}

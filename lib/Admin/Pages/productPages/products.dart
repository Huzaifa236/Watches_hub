
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Admin/Pages/productPages/add_products.dart';

import '../../../Constants/app_colors.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('Products').snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 2,
        title: const Text("Products"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                var data = snapshot.data!.docs[index];
                return ListTile(
                    leading: Text("${index+1}",style: const TextStyle(fontSize: 20),),
                    // title: Text(data['Email']),
                    // subtitle: Text(data['Username']),
                    trailing: SizedBox(
                      height: 50,
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            // updateUser(data['Username'],data['Email'],data.id,context);
                          },icon:const Icon(Icons.update),color: Colors.blueAccent,),
                          const SizedBox(width: 20,),
                          IconButton(onPressed:(){
                            // adminServices.deleteData(data.id, context);
                          },icon:const Icon(Icons.delete),color: Colors.redAccent,),
                        ],
                      ),
                    )
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context){
         return const AddProducts();
       }));
      },child: const Icon(Icons.add),),
    );
  }
}

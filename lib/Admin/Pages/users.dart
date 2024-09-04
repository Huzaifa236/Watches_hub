


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';

import '../../Widgets/my_button.dart';
import '../AdminServices/admin_services.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> key =GlobalKey<FormState>();
    final AdminServices adminServices= AdminServices();
    addUser(){
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Center(child: Text("Add User")),
            content: SizedBox(
              height: MediaQuery.of(context).size.height*0.500,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: userController,
                      cursorColor: Colors.black,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Username is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "User Name",
                          contentPadding: const EdgeInsets.only(left: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey.shade900,
                                width: 3),
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: emailController,
                      cursorColor: Colors.black,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Email is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: const EdgeInsets.only(left: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey.shade900,
                                width: 3),
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      cursorColor: Colors.black,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Password is empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: const EdgeInsets.only(left: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey.shade900,
                                width: 3),
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  MyButton(text: 'Add Data', onTap: (){
                    if(key.currentState!.validate())async {
                      adminServices.addUser(userController.text,emailController.text.trim(), passwordController.text, context);
                     Navigator.pop(context);
                    }
                  },),
                ],
              ),
            ),
          )
      );
    }

    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('Users').snapshots();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 2,
        title: const Text("Users"),
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
              title: Text(data['Email']),
              subtitle: Text(data['Username']),
              trailing: SizedBox(
                height: 50,
                width: 100,
                child: Row(
                  children: [
                    IconButton(onPressed: (){},icon:const Icon(Icons.update),color: Colors.blueAccent,),
                    const SizedBox(width: 20,),
                    IconButton(onPressed:(){},icon:const Icon(Icons.delete),color: Colors.redAccent,),
                  ],
                ),
              )
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        addUser();
      },child: const Icon(Icons.add),),
    );
  }
}

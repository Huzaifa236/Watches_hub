



import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';

import '../../../Widgets/my_button.dart';

class UpdateProducts extends StatefulWidget {
  const UpdateProducts({super.key});

  @override
  State<UpdateProducts> createState() => _UpdateProductsState();
}

class _UpdateProductsState extends State<UpdateProducts> {
  final TextEditingController productNameController =TextEditingController();
  final TextEditingController productPriceController =TextEditingController();
  final TextEditingController productDescController =TextEditingController();
  final TextEditingController productBrandController =TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  File? image;
  Uint8List? web;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Update Product",style: Theme.of(context).textTheme.displaySmall,),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(color: Colors.black,width: 1)
                          )
                      ),
                      onPressed: (){

                      }, child: const Text("Upload Product Image")),
                  const SizedBox(width: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.100,
                    width: MediaQuery.of(context).size.height*0.100,
                    decoration: BoxDecoration(
                      color: AppColors.drawerBackgroud,
                      border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.add_a_photo),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: productNameController,
                  cursorColor: Colors.black,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Product Name is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Product Name",
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
                  controller: productPriceController,
                  cursorColor: Colors.black,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Product Price is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Product Price",
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
                  controller: productDescController,
                  cursorColor: Colors.black,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Product Description is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Product Description",
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
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        contentPadding: const EdgeInsets.only(left: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.grey.shade900,
                              width: 3),
                        )
                    ),
                    items: [], onChanged: (value){}),
              ),
              const SizedBox(height: 20,),
              MyButton(text: 'Add Data', onTap: ()async{
                if(key.currentState!.validate()) {
                  // await adminServices.addUser(userController.text,emailController.text.trim(), passwordController.text, context);
                  if(context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },),
            ],
          ),
        ),
      ),
    );
  }
}

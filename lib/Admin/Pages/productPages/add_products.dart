



import 'dart:io';
import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watches_hub/Admin/AdminServices/productServices.dart';
import 'package:watches_hub/Admin/Pages/productPages/widgets.dart';
import 'package:watches_hub/Constants/app_colors.dart';
import 'package:watches_hub/Widgets/snackBar.dart';

import '../../../Widgets/my_button.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  List<String> brandList=[];
  final TextEditingController productNameController =TextEditingController();
  final TextEditingController productPriceController =TextEditingController();
  final TextEditingController productDescController =TextEditingController();
  final TextEditingController productBrandController =TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final ProductServices  productServices = ProductServices();
  File? image;
  Uint8List? web;
  String? selectedItem;
  getBrands(){
    FirebaseFirestore.instance
        .collection('Brands')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        brandList.add(doc["Brand"]);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBrands();
  }
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
              Text("Add Product",style: Theme.of(context).textTheme.displaySmall,),
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
                        showDialog(context: context, builder: (context){
                          return ImageDialog(onTapCamera: ()async{
                            final ImagePicker imagepicker =ImagePicker();
                         try{
                           XFile? pickedImage =await imagepicker.pickImage(source: ImageSource.camera);
                           if(pickedImage !=null){
                           setState(() async{
                             image=File(pickedImage.path);
                             web=await pickedImage.readAsBytes();
                           });
                           Navigator.pop(context);
                           showSnackBar(context, "Image Picked");

                           }
                           else{
                             showSnackBar(context, "Image Not Picked");
                           }
                         }catch(e){
                           showSnackBar(context, e.toString());
                         }
                          },onTapGallery: ()async{
                            final ImagePicker imagepicker =ImagePicker();
                            try{
                              XFile? pickedImage =await imagepicker.pickImage(source: ImageSource.gallery);
                              if(pickedImage !=null){
                                image=File(pickedImage.path);
                                web=await pickedImage.readAsBytes();
                                setState(() {

                                });
                                Navigator.pop(context);
                                print("Image Picked");
                                showSnackBar(context, "Image Picked");
                              }
                              else{
                                showSnackBar(context, "Image Not Picked");
                              }
                            }catch(e){
                              showSnackBar(context, e.toString());
                            }
                          },);
                        });
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
                    child:web !=null && image != null? kIsWeb?ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(web!,fit: BoxFit.cover,)):  const Icon(Icons.add_a_photo):const Icon(Icons.add_a_photo),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(onPressed: (){
                    image = null;
                    web = null;
                    setState(() {

                    });
                  }, child: const Text("Clear Picture"))
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
                  value: selectedItem,
                    decoration: InputDecoration(
                    hintText: "Brand Name",
                    contentPadding: const EdgeInsets.only(left: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade900,
                          width: 3),
                    )
                ),
                    items: brandList.map((value){
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value));
                    }).toList(), onChanged: (value){
                    selectedItem = value;
                }),
              ),
              const SizedBox(height: 20,),
              MyButton(text: 'Add Data', onTap: ()async{
                if(key.currentState!.validate()) {
                  await productServices.addProduct(productNameController.text, productPriceController.text, productDescController.text, image!, selectedItem!, context);
                  productNameController.clear();
                  productPriceController.clear();
                  productDescController.clear();
                  productBrandController.clear();
                  image = null;
                  web = null;
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

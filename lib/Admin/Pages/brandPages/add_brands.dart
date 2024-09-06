



import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watches_hub/Admin/AdminServices/brandServices.dart';
import 'package:watches_hub/Admin/Pages/productPages/widgets.dart';
import 'package:watches_hub/Constants/app_colors.dart';

import '../../../Widgets/my_button.dart';

class AddBrands extends StatefulWidget {
  const AddBrands({super.key});

  @override
  State<AddBrands> createState() => _AddBrandsState();
}

class _AddBrandsState extends State<AddBrands> {
  final BrandServices brandServices =BrandServices();
  final TextEditingController brandNameController =TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
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
              Text("Add Brand",style: Theme.of(context).textTheme.displaySmall,),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: brandNameController,
                  cursorColor: Colors.black,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "BrandName is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Brand Name",
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
              MyButton(text: 'Add Brand', onTap: ()async{
                if(key.currentState!.validate()) {
                  await brandServices.addBrand(brandNameController.text, context);
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

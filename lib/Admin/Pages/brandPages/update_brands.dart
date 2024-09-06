



import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';

import '../../../Widgets/my_button.dart';
import '../../AdminServices/brandServices.dart';

class UpdateBrands extends StatefulWidget {
  final String id;
  final String brandName;
  const UpdateBrands({super.key, required this.id, required this.brandName});

  @override
  State<UpdateBrands> createState() => _UpdateBrandsState();
}

class _UpdateBrandsState extends State<UpdateBrands> {
  final TextEditingController brandNameController =TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final BrandServices brandServices =BrandServices();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Update Brand",style: Theme.of(context).textTheme.displaySmall,),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: brandNameController..text=widget.brandName,
                  cursorColor: Colors.black,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Brand Name is empty";
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
              const SizedBox(height: 20),
              MyButton(text: 'Update Brand', onTap: ()async{
                if(key.currentState!.validate()) {
                 await brandServices.updateBrand(widget.id,widget.brandName, context);
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

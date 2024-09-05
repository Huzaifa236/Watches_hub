



import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';

class ImageDialog extends StatelessWidget {
  final void Function()? onTapGallery;
  final void Function()? onTapCamera;
  const ImageDialog({super.key, this.onTapGallery, this.onTapCamera});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      title: const Center(child: Text("Pick Option")),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onTapGallery,
            child: Container(
              height: MediaQuery.of(context).size.height*0.100,
              width: MediaQuery.of(context).size.width*0.150,
             decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("Gallery",style: Theme.of(context).textTheme.bodyLarge,)),
            ),
          ),
          const SizedBox(width: 30),
          GestureDetector(
            onTap: onTapCamera,
            child: Container(
              height: MediaQuery.of(context).size.height*0.100,
              width: MediaQuery.of(context).size.width*0.150,
              decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("Camera",style: Theme.of(context).textTheme.bodyLarge,)),
            ),
          ),
        ],
      ),
    );
  }
}

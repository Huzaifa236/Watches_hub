



import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:AppColors.buttonColor
        ),
        child: Center(child: GestureDetector(
            onTap: onTap,
            child: Text(text,style:const TextStyle(color: Colors.white,fontSize: 24),))),
      ),
    );
  }
}

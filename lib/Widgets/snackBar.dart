



import 'package:flutter/material.dart';
import 'package:watches_hub/Constants/app_colors.dart';

showSnackBar(BuildContext context,String text){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.backgroundColor,
      content: Text(text)));
}
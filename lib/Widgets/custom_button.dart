import 'package:flutter/material.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  final String text;
  CustomButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text(text,style: customeTextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),),
        ),
      ),
    );
  }
}
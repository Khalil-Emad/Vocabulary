import 'package:flutter/material.dart';
import 'package:vocabulary/core/app_export.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.v,
        decoration: BoxDecoration(
            color: ColorsManager.buttonColor,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: ColorsManager.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}

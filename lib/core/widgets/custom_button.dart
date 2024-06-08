import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.text,
      this.borderRadius,
      required this.textColor});
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            )),
        onPressed: () {},
        child: Text(
          text,
          style: Style.textStyle18.copyWith(color: textColor),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: CustomButton(
          backgroundColor: Colors.white,
          text: "19.99%",
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        )),
        Expanded(
            child: CustomButton(
          backgroundColor: Color(0xffEF8262),
          text: "Free Preview",
          textColor: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        )),
      ],
    );
  }
}

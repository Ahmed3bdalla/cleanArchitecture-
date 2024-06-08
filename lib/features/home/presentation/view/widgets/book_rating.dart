import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate,
          size: 26,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "4.8",
          style: Style.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          "(2390)",
          style: Style.textStyle14,
        ),
      ],
    );
  }
}

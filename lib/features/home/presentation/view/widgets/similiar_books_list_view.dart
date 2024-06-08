import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimiliarBooksListView extends StatelessWidget {
  const SimiliarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, i) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(image: "",),
          );
        },
      ),
    );
  }
}
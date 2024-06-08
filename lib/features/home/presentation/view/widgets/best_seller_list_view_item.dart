import 'package:booklyapp/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssetsData.testImage))),
                  child: Image.asset(AssetsData.testImage)),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: const Text(
                      "Harry Potter and flutter fire",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyle20,
                    ),
                  ),
                  const Text(
                    "J.K. Rowling",
                    style: Style.textStyle14,
                  ),
                  const Row(
                    children: [
                      Text(
                        "19.99 €",
                        style: Style.textStyle20,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      BookRating()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

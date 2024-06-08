import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:booklyapp/features/home/presentation/view/widgets/featured_books_listview_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 35),
                child: CustomAppBar(),
              ),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Sellers',
                  style: Style.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}

import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Result",
                  style: Style.textStyle30,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: BestSellerListView())
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: "Search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            suffix: const Icon(Icons.search)));
  }
}

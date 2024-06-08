import 'package:booklyapp/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:booklyapp/features/home/presentation/view/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
        builder: (context, state) {
      if (state is FeaturedBookSuccess) {
        return FeaturedBooksListView(
          books: state.books,
        );
      } else if (state is FeaturedBookFailure) {
        return Text(state.errMessage);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

import 'package:booklyapp/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:booklyapp/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());
  FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber=0}) async {
    emit(FeaturedBookLoading());
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(FeaturedBookFailure(failure.errorMessaage));
    }, (books) {
      emit(FeaturedBookSuccess(books));
    });
  }
}

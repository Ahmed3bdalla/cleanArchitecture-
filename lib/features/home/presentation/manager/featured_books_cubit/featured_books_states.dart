import 'package:booklyapp/features/home/domain/entities/home_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBookInitial extends FeaturedBooksStates {}

class FeaturedBookLoading extends FeaturedBooksStates {}

class FeaturedBookFailure extends FeaturedBooksStates {
  final String errMessage;
  FeaturedBookFailure(this.errMessage);
}

class FeaturedBookSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;
  FeaturedBookSuccess(this.books);
}

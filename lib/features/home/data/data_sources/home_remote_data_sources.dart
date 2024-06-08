import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/api_services.dart';
import 'package:booklyapp/core/utils/functions/save_books_data.dart';
import 'package:booklyapp/features/home/data/models/book_model/book_model.dart';

import '../../domain/entities/home_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=Programming&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=Programming&Sorting=newest");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}

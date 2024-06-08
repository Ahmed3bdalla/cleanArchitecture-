import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklyapp/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:booklyapp/features/home/domain/entities/home_entity.dart';
import 'package:booklyapp/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  HomeLocalDataSourceImpl homeLocalDataSourceImpl;
  HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;
  HomeRepoImpl({required this.homeLocalDataSourceImpl,required this.homeRemoteDataSourceImpl});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSourceImpl.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSourceImpl.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSourceImpl.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSourceImpl.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

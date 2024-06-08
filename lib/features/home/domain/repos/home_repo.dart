import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/features/home/domain/entities/home_entity.dart';
import 'package:dartz/dartz.dart';

//architecture of app
abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}

import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/features/home/domain/entities/home_entity.dart';
import 'package:booklyapp/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param=0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}

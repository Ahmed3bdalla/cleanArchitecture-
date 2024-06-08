import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/use_cases/use_case.dart';
import 'package:booklyapp/features/home/domain/entities/home_entity.dart';
import 'package:booklyapp/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetchNewestBooks();
  }
}

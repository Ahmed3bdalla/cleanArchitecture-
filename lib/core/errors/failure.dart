import 'package:dio/dio.dart';

abstract class Failure {
  String errorMessaage;
  Failure(this.errorMessaage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessaage);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('connectionError');
      case DioExceptionType.unknown:
        return ServerFailure('unknown');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']["message"]);
    } else {
      return ServerFailure('There was an error, please try again');
    }
  }
}

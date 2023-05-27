import 'package:dio/dio.dart';

abstract class Failure {
  final String errMesage;

  Failure(this.errMesage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMesage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");

      case DioErrorType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioErrorType.badCertificate:
        return ServerFailure("BadCertificate timeout with ApiServer");

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!);

      case DioErrorType.cancel:
        return ServerFailure(" Request to ApiServer was Canceld");

      case DioErrorType.unknown:
        return ServerFailure("opps There was an Error , plase try again");

      case DioErrorType.connectionError:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure(" No Internet Connection");
        }
        return ServerFailure("unexpected Error , plasy try later.");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["mesage"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found. Plase try later");
    } else if (statusCode == 500) {
      return ServerFailure("internal Server error ,plase try later");
    } else {
      return ServerFailure("opps There was an Error , plase try again");
    }
  }
}

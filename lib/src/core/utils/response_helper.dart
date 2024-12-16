import 'dart:io';
import 'package:app_flutter_starter_for_job/src/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class ResponseHelper {
  static Exception returnResponse(DioException dioException) {
    try {
      if (dioException.error.runtimeType == SocketException &&
          dioException.type == DioException.connectionError) {
        return const SocketException("No Internet");
      } else if (dioException.type == DioException.connectionTimeout) {
        return ConnectionException("Internet Timeout");
      } else {
        return ServerException(dioException.response?.data['message'] ?? "Something went wrong");
      }
    } on DioException catch (dioException) {
      return ServerException(
          dioException.response?.data['message'] ?? "Something went wrong");
    }
  }
}

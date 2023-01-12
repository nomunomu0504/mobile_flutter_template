import 'package:dio/dio.dart';
import 'package:flutter_template/logger/logger.dart';

/// Appエラー
enum AppErrorType {
  // dummy error
  dummyError,
  // API: Timeout
  apiTimedOut,
  // API: Offline
  apiOffline,
  // API: 204
  apiNoContent,
  // API: 400
  apiBadRequest,
  // API: 401
  apiUnauthorized,
  // API: 403
  apiForbidden,
  // API: 404
  apiNotFound,
  // API: 500
  apiInternalServerError,
  // API: 不明
  apiUnknown,
}

class AppError implements Exception {
  factory AppError.dummyError(dynamic originalError, StackTrace? stackTrace) {
    return AppError(AppErrorType.dummyError, originalError, stackTrace);
  }

  factory AppError.fromDioError(DioError dioError, StackTrace? stackTrace) {
    logger.severe(dioError.error);

    final int? statusCode = dioError.response?.statusCode;
    if (statusCode == null) {
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return AppError(AppErrorType.apiTimedOut, dioError, stackTrace);
        default:
          if (dioError.response == null) {
            return AppError(AppErrorType.apiOffline, dioError, stackTrace);
          }

          return AppError(AppErrorType.apiUnknown, dioError, stackTrace);
      }
    }

    AppErrorType errorType;
    switch (statusCode) {
      case 204:
        errorType = AppErrorType.apiNoContent;
        break;
      case 400:
        errorType = AppErrorType.apiBadRequest;
        break;
      case 401:
        errorType = AppErrorType.apiUnauthorized;
        break;
      case 403:
        errorType = AppErrorType.apiForbidden;
        break;
      case 404:
        errorType = AppErrorType.apiNotFound;
        break;
      case 500:
        errorType = AppErrorType.apiInternalServerError;
        break;
      default:
        switch (dioError.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
            errorType = AppErrorType.apiTimedOut;
            break;
          default:
            errorType = AppErrorType.apiUnknown;
        }
        break;
    }

    return AppError(errorType, dioError, stackTrace);
  }

  AppError(
    AppErrorType type,
    dynamic originalError,
    StackTrace? stackTrace, {
    String? message,
  })  : _type = type,
        _originalError = originalError,
        _stackTrace = stackTrace,
        _message = message;

  final AppErrorType _type;
  AppErrorType get type => _type;

  final dynamic _originalError;
  dynamic get originalError => _originalError;

  final StackTrace? _stackTrace;
  StackTrace? get stackTrace => _stackTrace;

  final String? _message;
  String? get message => _message;

  String get originalMessage => originalError?.toString() ?? "";

  @override
  String toString() {
    var msg = "AppError [$type]: ${message ?? originalMessage}";
    if (stackTrace != null) {
      msg += "\n$stackTrace";
    }
    return msg;
  }
}

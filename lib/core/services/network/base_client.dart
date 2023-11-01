import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/api_constants.dart';
import '../../models/exceptions/network_exception.dart';
import 'network_connection.dart';

class BaseClient {
  BaseClient._() {
    _setupAuthHeaderInterceptor();
  }

  static final BaseClient _instance = BaseClient._();
  static BaseClient get instance => _instance;

  void _setupAuthHeaderInterceptor() {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler r) async {
          options.headers['Accept'] = "*/*";
          options.contentType = Headers.jsonContentType;
          options.queryParameters.addAll({"api_key": dotenv.env["TMDB_KEY"]});
          r.next(options);
        },
        onError: (e, handler) {
          handler.next(e);
        },
      ),
      PrettyDioLogger(requestBody: true)
    ]);
  }

  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseurl,
      contentType: Headers.jsonContentType,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"accept": "application/json"},
      responseType: ResponseType.json));

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        final res = await _dio.get(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        final res = await _dio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        log(e.toString());
        throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.toNetworkException();
    } on NetworkExceptions catch (_) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.toNetworkException();
    } on NetworkExceptions catch (_) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.toNetworkException();
    } on NetworkExceptions catch (_) {
      rethrow;
    }
  }
}

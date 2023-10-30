import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';
import '../../constants/storage_constant.dart';
import '../../models/exceptions/network_exception.dart';
import '../../widgets/toast/toast.dart';
import 'network_connection.dart';

class BaseClient {
  BaseClient._() {
    _setupAuthHeaderInterceptor();
  }

  static final BaseClient _instance = BaseClient._();
  static BaseClient get instance => _instance;

  void _setupAuthHeaderInterceptor() {
    //get token
    // _dio.interceptors.addAll([
    //   QueuedInterceptorsWrapper(
    //     onRequest: (RequestOptions options, RequestInterceptorHandler r) async {
    //       final isAuthenticated = (AuthProvider.hasToken());
    //       options.headers['Accept'] = "*/*";
    //       options.contentType = Headers.jsonContentType;
    //       if (isAuthenticated) {
    //         final token = SharedPreferencesImp.read(StorageConstant.token);
    //         options.headers["Authorization"] = "Bearer $token";
    //       }
    //       r.next(options);
    //     },
    //     onError: (e, handler) async {
    //       if ((e.response?.statusCode == 401)) {
    //         if (AuthProvider.hasToken()) {
    //           if (await AuthProvider.checkSession()) {
    //             return handler.resolve(await _retry(e.requestOptions));
    //           } else {
    //             if (await AuthProvider.rememberMe()) {
    //               return handler.resolve(await _retry(e.requestOptions));
    //             } else {
    //               showErrorToast("Session Expired");
    //               SharedPreferencesImp.deleteAll();
    //               appRouter.replace(LoginRoute());
    //             }
    //           }
    //         } else {
    //           handler.next(e);
    //         }
    //       } else {
    //         handler.next(e);
    //       }
    //     },
    //   ),
    // ]);
  }

  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseurl,
      contentType: Headers.jsonContentType,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"accept": "application/json"},
      responseType: ResponseType.json));

  final Dio _tokenDio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseurl,
      contentType: Headers.jsonContentType,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"accept": "application/json"},
      responseType: ResponseType.json));

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return _dio.fetch<dynamic>(requestOptions);
  }

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

  Future<dynamic> postIsolate(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        final res = await _tokenDio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
        log(res.statusCode.toString());
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

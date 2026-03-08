import 'package:dio/dio.dart';

/// Provides auth tokens for API requests.
/// Each app (mobile, web) implements this with its own auth mechanism.
abstract class AuthTokenProvider {
  Future<String?> getToken();
}

class AuthInterceptor extends Interceptor {
  final AuthTokenProvider _tokenProvider;

  AuthInterceptor(this._tokenProvider);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _handleUnauthorized(err);
    } else if (err.response?.statusCode == 403) {
      _handleForbidden(err);
    }

    handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_shouldSkipAuth(options.path)) {
      handler.next(options);
      return;
    }

    try {
      final token = await _tokenProvider.getToken();

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }

  void _handleForbidden(DioException err) {
    // ignore: avoid_print
    print('Access forbidden: ${err.message}');
  }

  void _handleUnauthorized(DioException err) {
    // ignore: avoid_print
    print('Auth token expired or invalid: ${err.message}');
  }

  bool _shouldSkipAuth(String path) {
    const unauthenticatedPaths = [
      '/auth/login',
      '/auth/register',
      '/auth/refresh',
      '/health',
      '/public/',
    ];

    return unauthenticatedPaths.any((p) => path.startsWith(p));
  }
}

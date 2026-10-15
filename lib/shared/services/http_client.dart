import 'package:dio/dio.dart';
import 'package:ecommerce/shared/exceptions/http_client_exception.dart';

class HttpClient {
  static final String baseUrl =
      'https://api-production-c0289.up.railway.app/api/v1';
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'Application/json',
        'Accept': 'Application/json',
      },
    ),
  );

  Future<Response> get(String endpoint) async {
    return await dio.get(endpoint);
  }

  Future<Response> post(
    String endpoint, {
    required Map<String, dynamic> json,
  }) async {
    try {
      return await dio.post(endpoint, data: json);
    } on DioException catch (e) {
      if (e.response != null) {
        throw HttpClientException(
          message: 'Erro na requisição: ${e.response?.statusMessage}',
          statusCode: e.response?.statusCode,
          responseData: e.response?.data,
        );
      } else {
        throw HttpClientException(
          message: 'Erro na requisição: ${e.response?.data['message']}',
        );
      }
    }
  }
}

import 'package:dio/dio.dart';

class Service {
  static final String baseUrl =
      'https://api-production-c0289.up.railway.app/api/v1';
  final Dio dio;

  Service()
    : dio = Dio(
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
}

import 'package:dio/dio.dart';
import 'package:ecommerce/pages/loginPage/model/user.dart';
import 'package:ecommerce/shared/services/service.dart';

class SingUpService extends Service {
  static String registerRoute = '/auth/register';

  Future<Response> register(User user) async {
    try {
      final response = await dio.post(registerRoute, data: user.registerJson());

      return response;
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 409:
          throw Exception('E-mail já cadastrado');

        case 422:
          throw Exception('Dados inválidos');

        case 429:
          throw Exception(
            'Muitas tentativas, aguarde antes de tentar novamente',
          );

        default:
          rethrow;
      }
    }
  }
}

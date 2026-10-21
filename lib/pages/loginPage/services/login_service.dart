import 'package:ecommerce/pages/loginPage/model/user.dart';
import 'package:ecommerce/shared/exceptions/http_client_exception.dart';
import 'package:ecommerce/shared/services/http_client.dart';

class LoginService {
  HttpClient client = HttpClient();
  String endpoint = '/auth/login';

  Future<User?> login({required String email, required String password}) async {
    try {
      final response = await client.post(
        endpoint,
        json: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }

      throw HttpClientException(message: 'Erro ao fazer login');
    } on HttpClientException catch (e) {
      final body = e.responseData;
      if (body != null && body is Map) {
        final code = body['code']?.toString();
        final message = body['message']?.toString();

        if (code == 'INVALID_CREDENTIALS') {
          throw Exception(message ?? 'Credenciais inválidas');
        }

        if (code == 'VALIDATION_ERROR') {
          throw Exception(message ?? 'Dados inválidos');
        }

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (e.statusCode != null) {
        throw Exception(
          'Erro ao fazer login. Código de status: ${e.statusCode}',
        );
      }

      throw Exception('Erro ao fazer login. Detalhes: ${e.message}');
    }
  }
}

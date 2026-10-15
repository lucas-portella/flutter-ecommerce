import 'package:dio/dio.dart';
import 'package:ecommerce/pages/loginPage/model/user.dart';
import 'package:ecommerce/shared/exceptions/http_client_exception.dart';
import 'package:ecommerce/shared/services/http_client.dart';

class SingUpService {
  static const String endpoint = '/auth/register';

  final HttpClient client = HttpClient();

  Future<User?> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required bool acceptedTerms,
  }) async {
    try {
      final response = await client.post(
        endpoint,
        json: {
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'acceptedTerms': acceptedTerms,
        },
      );

      if (response.statusCode == 201) {
        return User.fromJson(response.data);
      }

      throw HttpClientException(message: 'Erro ao registrar usuário');
    } on HttpClientException catch (e) {
      final body = e.responseData;
      if (body != null && body is Map) {
        final code = body['code']?.toString();
        final message = body['message']?.toString();
        final details = body['details'];

        if (code == 'EMAIL_ALREADY_EXISTS') {
          throw Exception(message ?? 'Este email já está cadastrado');
        }

        if (code == 'VALIDATION_ERROR' && details is List) {
          final messages = details
              .whereType<Map>()
              .map((detail) => detail['message']?.toString())
              .whereType<String>()
              .where((detailMessage) => detailMessage.isNotEmpty)
              .toSet();
          if (messages.isNotEmpty) {
            throw Exception(messages.join('\n'));
          }
        }

        if (message != null && message.isNotEmpty) {
          throw Exception(message);
        }
      }

      if (e.statusCode != null) {
        throw Exception(
          'Nao foi possivel criar a conta. Confira os dados e tente novamente.',
        );
      }
      throw Exception(
        'Nao foi possivel conectar ao servidor. Tente novamente.',
      );
    }
  }
}

import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/shared/exceptions/http_client_exception.dart';
import 'package:ecommerce/shared/services/http_client.dart';

class CategoriesService {
  static String endpoint = '/categories';

  Future<List<Category>?> getCategories() async {
    HttpClient client = HttpClient();

    try {
      final response = await client.get(endpoint);

      if (response.statusCode == 200) {
        List<Category> categories = (response.data['data'] as List)
            .map((item) => Category.fromMap(item))
            .toList();
        return categories;
      }
    } on HttpClientException catch (e) {
      final body = e.responseData;
      if (body != null && body is Map) {
        final code = body['code']?.toString();
        final message = body['message']?.toString();
        if (code == 'INTERNAL_ERROR') {
          throw Exception(
            message ?? 'Erro interno, tente novamente mais tarde',
          );
        }
      }

      throw Exception('Erro ao resgatar categorias. Detalhes: ${e.message}');
    }

    return null;
  }
}

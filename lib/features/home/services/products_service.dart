import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/shared/exceptions/http_client_exception.dart';
import 'package:ecommerce/shared/services/http_client.dart';

class ProductsService {
  static const String endpoint = '/products';

  Future<List<Product>> getProducts() async {
    HttpClient client = HttpClient();

    try {
      final response = await client.get(endpoint);

      if (response.statusCode == 200) {
        List<Product> products = (response.data['data'] as List)
            .map((item) => Product.fromMap(item))
            .toList();
        return products;
      }
    } on HttpClientException catch (e) {
      final body = e.responseData;
      if (body != null && body is Map) {
        final code = body['code']?.toString();
        final message = body['message']?.toString();
        if (code == 'VALIDATION_ERROR') {
          throw Exception(message ?? 'Dados inváldos');
        }
      }

      throw Exception('Erro ao resgatar produtos. Detalhes: ${e.message}');
    }

    return [];
  }
}

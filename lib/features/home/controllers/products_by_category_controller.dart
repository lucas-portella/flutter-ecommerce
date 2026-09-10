import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';

enum ProductsByCategoryStateView { loading, error, success }

class ProductsByCategoryController extends ChangeNotifier {
  String _query = '';
  List<Product> products = [];
  ProductsByCategoryStateView _state = ProductsByCategoryStateView.loading;

  ProductsByCategoryController();

  void changeState(ProductsByCategoryStateView state) {
    _state = state;
    notifyListeners();
  }

  ProductsByCategoryStateView get state => _state;

  Future<void> getProductsFromCategory(String category) async {
    changeState(ProductsByCategoryStateView.loading);
    await Future.delayed(Duration(seconds: 3));

    try {
      products = productsJson
          .map((item) => Product.fromMap(item))
          .where((product) => product.category == category)
          .toList();
      changeState(ProductsByCategoryStateView.success);
    } catch (e) {
      changeState(ProductsByCategoryStateView.error);
    }
  }
}

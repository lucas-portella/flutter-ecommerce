import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/models/products_model.dart';
import 'package:ecommerce/shared/mocks.dart';
import 'package:flutter/material.dart';

enum CategoriesView { loading, success, error }

enum ProductsView { loading, success, error }

class HomePageController extends ChangeNotifier {
  List<Category> categories = [];
  CategoriesView categoriesState = CategoriesView.loading;
  List<Product> products = [];
  ProductsView productsState = ProductsView.loading;

  void changeCategoriesState(CategoriesView state) {
    categoriesState = state;
    notifyListeners();
  }

  void changeProductsState(ProductsView state) {
    productsState = state;
    notifyListeners();
  }

  void getCategories() async {
    changeCategoriesState(CategoriesView.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = categoriesJson
          .map((category) => Category.fromMap(category))
          .toList();
      changeCategoriesState(CategoriesView.success);
    } catch (e) {
      changeCategoriesState(CategoriesView.error);
    }
  }

  void getProducts() async {
    changeProductsState(ProductsView.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      products = productsJson.map((item) {
        return Product.fromMap(item);
      }).toList();
      changeProductsState(ProductsView.success);
    } catch (e) {
      changeProductsState(ProductsView.error);
    }
  }
}

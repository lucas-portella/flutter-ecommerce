import 'package:flutter/material.dart';

enum CategoriesView { loading, success, error }

enum ProductsView { loading, success, error }

class HomePageController extends ChangeNotifier {
  List<Category> categories = [];
  CategoriesView categoriesState = CategoriesView.loading;

  void changeCategoriesState(CategoriesView state) {
    categoriesState = state;
    notifyListeners();
  }

  void getCategories() async {
    changeCategoriesState(CategoriesView.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      categories = [
        for (var element in categoriesJson) Category.fromMap(element),
      ];
      changeCategoriesState(CategoriesView.success);
    } catch (e) {
      changeCategoriesState(CategoriesView.error);
    }
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(name: map['name'] ?? '', imageUrl: map['imageUrl'] ?? '');
  }
}

final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
];

final List<Map<String, dynamic>> productsJson = [
  {
    'brand': 'Natural da terra',
    'name': 'Rabanete',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 10.99,
  },
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
];

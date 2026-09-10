import 'package:ecommerce/features/home/controllers/home_page_controller.dart';
import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/features/home/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.state,
    required this.categories,
  });

  final CategoriesView state;
  final List<Category> categories;

  static final List<Category> _fakeCategories = List.filled(
    4,
    Category(name: 'Categoria', imageUrl: ''),
  );

  @override
  Widget build(BuildContext context) {
    if (state == CategoriesView.error) {
      return const Text('Problema ao resgatar categorias');
    }

    final isLoading = state == CategoriesView.loading;
    final items = isLoading ? _fakeCategories : categories;

    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryCard(category: items[index]);
          },
        ),
      ),
    );
  }
}

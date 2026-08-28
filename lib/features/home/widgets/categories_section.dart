import 'package:ecommerce/features/home/models/category_model.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum CategorySectionStateView { loading, error, success }

class CategoriesSection extends StatelessWidget {
  final List<Category> categories;
  final CategorySectionStateView state;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      child: switch (state) {
        _ => Skeletonizer(
          enabled: state == CategorySectionStateView.loading,
          enableSwitchAnimation: true,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 76, width: 76, child: Bone.circle()),
                    Text('Placeholder'),
                  ],
                ),
              );
            },
          ),
        ),
        CategorySectionStateView.error => Text(
          'Problema ao resgatar categorias',
        ),
      },
    );
  }
}

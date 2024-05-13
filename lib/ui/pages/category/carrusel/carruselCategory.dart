import 'package:flutter/material.dart';
import 'package:foody/ui/pages/category/carrusel/categoryButton.dart';

import '../../../../domain/controllers/controllersCategory.dart';

class CategoryCarousel extends StatelessWidget {
  final CategoryController _categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    final scrollbarColor = Theme.of(context).scrollbarTheme.thumbColor;

    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: scrollbarColor,
        ),
      ),
      child: SizedBox(
        height: 120.0,
        child: Scrollbar(
          // Muestra la barra de desplazamiento siempre
          
          thickness: 10.0,
          radius: const Radius.circular(10.0),
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 5.0),
            itemCount: _categoryController.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: CategoryButton(
                  category: _categoryController.categories[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

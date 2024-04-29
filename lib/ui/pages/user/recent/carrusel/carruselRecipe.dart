import 'package:flutter/material.dart';
import 'package:foody/domain/controllers/controllersCarruselRecipe.dart';
import 'package:foody/ui/pages/user/recent/carrusel/recipeButton.dart';

class RecipeCarousel extends StatelessWidget {
  final RecipeController _recentController = RecipeController();

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
        height: 230.0,
        child: Scrollbar(
          // Muestra la barra de desplazamiento siempre

          thickness: 10.0,
          radius: const Radius.circular(10.0),
          child: ListView.builder(
            itemCount: _recentController.listRecipes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: RecipeButton(
                  recent: _recentController.listRecipes[index],
                  recentController: _recentController,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

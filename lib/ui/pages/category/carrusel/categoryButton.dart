import 'package:flutter/material.dart';
import 'package:foody/ui/pages/category/category.dart';

import '../../../../domain/models/category.dart';

class CategoryButton extends StatelessWidget {
  final Category category;
  final double iconSize;

  const CategoryButton(
      {Key? key, required this.category, this.iconSize = 125.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(category: category),
          ),
        );
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: SizedBox(
        height: 300,
        width: 125,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height:
                      99, // Establece la altura igual a la altura de la tarjeta
                  width: 120, // Establece el ancho igual al ancho de la tarjeta
                  child: AspectRatio(
                    aspectRatio: 1, // Mantiene la relación de aspecto cuadrada
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FittedBox(
                        fit: BoxFit
                            .cover, // Hace que la imagen cubra toda la tarjeta
                        child: category.image,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

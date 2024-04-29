import 'package:flutter/material.dart';
import 'package:foody/domain/controllers/controllersCarruselRecipe.dart';
import 'package:foody/domain/models/recipe.dart';

class RecipeButton extends StatefulWidget {
  final Recipe recent;
  final RecipeController recentController;

  const RecipeButton(
      {Key? key, required this.recent, required this.recentController})
      : super(key: key);

  @override
  _RecipeButtonState createState() => _RecipeButtonState();
}

class _RecipeButtonState extends State<RecipeButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 205,
        width: 185,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 3),
                      child: AspectRatio(
                        aspectRatio: 300 / 100,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: widget.recent.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.recent.tittle,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                              if (_isFavorite) {
                                widget.recentController.listRecipes
                                    .add(widget.recent);
                              } else {
                                widget.recentController.listRecipes
                                    .remove(widget.recent);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

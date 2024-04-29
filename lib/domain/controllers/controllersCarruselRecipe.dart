import 'package:flutter/material.dart';
import 'package:foody/domain/models/recipe.dart';

class RecipeController {
  final List<Recipe> listRecipes = [
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Sandwichito\nSabrosito',
        description: 'Sandwichito\nSabrosito'),
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Bueñuelito\nSabrosito',
        description: 'Bueñuelito\nSabrosito'),
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pastas\nItaliana',
        description: 'Pastas Estilo Italiano'),
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pescados\nde Aji',
        description: 'Pescados de Aji'),
  ];

  final List<Recipe> myRecipes = [
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Sandwichito\nSabrosito',
        description: 'Sandwichito\nSabrosito'),
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pollo\nSabrosito',
        description: 'Pollo\nSabrosito'),
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pastas\nAlemanas',
        description: 'Pastas Estilo Italiano'),
    Recipe(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pescados\nde Aji',
        description: 'Pescados de Aji'),
  ];
}

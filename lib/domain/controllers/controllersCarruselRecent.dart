import 'package:flutter/material.dart';
import 'package:foody/domain/models/recent.dart';

class RecentController {
  final List<Recent> listRecent = [
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Sandwichito Sabrosito',
        description: 'Sandwichito Sabrosito'),
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Bueñuelito Sabrosito',
        description: 'Bueñuelito Sabrosito'),
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pastas Italiana',
        description: 'Pastas Estilo Italiano'),
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pescados de Aji',
        description: 'Pescados de Aji'),
  ];

  final List<Recent> myRecipes = [
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'ss Sabrosito Papdasdaso paos',
        description: 'Sandwichitoddada Sabrosito'),
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pollo Sabrosito',
        description: 'Pollo Sabrosito'),
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pastas Alemanas',
        description: 'Pastas Estilo Italiano'),
    Recent(
        image: Image.asset('assets/assets/images/recet1.jpg'),
        tittle: 'Pescados de Aji',
        description: 'Pescados de Aji'),
  ];
}

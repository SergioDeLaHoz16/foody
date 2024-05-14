import 'package:flutter/material.dart';
import 'package:foody/domain/models/recent.dart';

class RecentController {
  final List<Recent> listRecent = [
    Recent(
      image: Image.asset('assets/assets/images/recet1.jpg'),
      title: 'Sandwichito Sabrosito',
      description: 'Sandwichito Sabrosito',
      ingredients: ['Pan', 'Jamón', 'Queso', 'Tomate', 'Lechuga'],
    ),
    Recent(
      image: Image.asset('assets/assets/images/recet1.jpg'),
      title: 'Bueñuelito Sabrosito',
      description: 'Bueñuelito Sabrosito',
      ingredients: ['Harina', 'Huevo', 'Sal', 'Azúcar', 'Levadura'],
    ),
    Recent(
      image: Image.asset('assets/assets/images/recet1.jpg'),
      title: 'Pastas Italiana',
      description: 'Pastas Estilo Italiano',
      ingredients: ['Pasta', 'Salsa de tomate', 'Queso parmesano', 'Albahaca'],
    ),
    Recent(
      image: Image.asset('assets/assets/images/recet1.jpg'),
      title: 'Pescados de Aji',
      description: 'Pescados de Aji',
      ingredients: ['Filete de pescado', 'Aji amarillo', 'Limón', 'Ajo', 'Sal'],
    ),
  ];
  
}

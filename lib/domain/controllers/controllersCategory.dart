import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryController {
  final List<Category> categories = [
    Category(
        name: 'Frutas',
        image: Image.asset('assets/assets/images/imageFruit.png')),
    Category(
        name: 'Vegetales',
        image: Image.asset('assets/assets/images/imageVegetables.png')),
    Category(
        name: 'Harinas',
        image: Image.asset('assets/assets/images/imageHarinas.png')),
    Category(
        name: 'Pescados',
        image: Image.asset('assets/assets/images/imagePescados.png')),
    Category(
        name: 'Carnes',
        image: Image.asset('assets/assets/images/imageCarnes.png')),
    Category(
        name: 'Lácteos',
        image: Image.asset('assets/assets/images/imageLacteos.png')),
    Category(
        name: 'Cereales',
        image: Image.asset('assets/assets/images/imageCereales.png')),
    Category(
        name: 'Legumbres',
        image: Image.asset('assets/assets/images/imageLegumbres.png')),
    Category(
        name: 'Bebidas',
        image: Image.asset('assets/assets/images/imageBebidas.png')),
  ];
}

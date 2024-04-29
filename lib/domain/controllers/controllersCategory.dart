import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryController {
  final List<Category> categories = [
    Category(name: 'Frutas', icon: Icons.local_florist),
    Category(name: 'Vegetales', icon: Icons.grass),
    Category(name: 'Harinas', icon: Icons.local_pizza),
    Category(name: 'Pescados', icon: Icons.local_see),
    Category(name: 'Carnes', icon: Icons.local_dining),
    Category(name: 'Lácteos', icon: Icons.local_drink),
    Category(name: 'Cereales', icon: Icons.grain),
    Category(name: 'Legumbres', icon: Icons.eco),
    Category(name: 'Bebidas', icon: Icons.local_cafe),
  ];
}

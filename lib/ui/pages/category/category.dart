import 'package:flutter/material.dart';

import '../../../domain/models/category.dart';

class CategoryPage extends StatelessWidget {
  final Category category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Center(
        child: Text('Contenido de la categoría ${category.name}'),
      ),
    );
  }
}

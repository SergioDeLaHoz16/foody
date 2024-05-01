import 'package:flutter/material.dart';
import 'package:foody/domain/models/recent.dart';

class RecentPage extends StatelessWidget {
  final Recent recent;

  const RecentPage({super.key, required this.recent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recent.description),
      ),
      body: Center(
        child: Text('Contenido de la categoría ${recent.description}'),
      ),
    );
  }
}

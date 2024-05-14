import 'package:flutter/material.dart';
import 'package:foody/domain/models/recent.dart';
import 'package:foody/domain/controllers/controllersCarruselRecent.dart';

class RecentPage extends StatelessWidget {
  final Recent recent;
  final RecentController _recentController = RecentController();

  RecentPage({Key? key, required this.recent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Center(
        child: Container(
          constraints:
              BoxConstraints(maxHeight: 600), // Altura máxima de la página
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSection(
                    image: recent.image,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    borderRadius: 15.0,
                    boxShadow: BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 4),
                    ),
                  ),
                  TitleSection(
                    name: recent.title,
                    description: recent.description,
                  ),
                  IngredientsSection(
                    ingredients: _recentController.listRecent
                        .map((recent) => recent.title)
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String description;

  const TitleSection({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(30, 30, 30, 0.25)),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 1)),
          ),
        ],
      ),
    );
  }
}

class IngredientsSection extends StatelessWidget {
  final List<String> ingredients;

  const IngredientsSection({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingredientes:',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(30, 30, 30, 0.25)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ingredients.map((ingredient) {
              return Text(
                '- $ingredient',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final Image image;
  final EdgeInsets padding;
  final double borderRadius;
  final BoxShadow boxShadow;

  const ImageSection({
    Key? key,
    required this.image,
    this.padding = const EdgeInsets.all(10.0),
    this.borderRadius = 40.0,
    this.boxShadow = const BoxShadow(
      color: Colors.black26,
      blurRadius: 4.0,
      spreadRadius: 2.0,
      offset: Offset(0, 2),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [boxShadow],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: image,
        ),
      ),
    );
  }
}

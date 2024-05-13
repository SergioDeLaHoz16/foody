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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSection(
                image: recent.image,
              ),
              TitleSection(
                name: recent.title,
                description: recent.description,
              ),
              IngredientsSection(
                ingredients: recent
                    .ingredients, // Usa la lista de ingredientes de la receta actual
              ),
            ],
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
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
            ),
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
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ingredients.map((ingredient) {
              return Text(
                '- $ingredient',
                style: const TextStyle(
                  fontSize: 16,
                ),
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

  const ImageSection({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: image,
    );
  }
}

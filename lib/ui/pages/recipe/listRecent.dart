import 'package:flutter/material.dart';
import 'package:foody/domain/models/recent.dart';

class MyRecipesPage extends StatelessWidget {
  final List<Recent> myRecipes = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mis Recetas',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListView.builder(
          itemCount: myRecipes.length,
          itemBuilder: (context, index) {
            final recent = myRecipes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: RecentButton(recent: recent),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecentButton extends StatelessWidget {
  final Recent recent;

  const RecentButton({
    Key? key,
    required this.recent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: 130,
                height: 149,
                child: AspectRatio(
                  aspectRatio: 0.6,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(0, 0, 0, 0)
                                .withOpacity(0.25),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: recent.image,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 13.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recent.title,
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(30, 30, 30, 0.5)),
                    ),
                    const SizedBox(height: 2.0),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        recent.description,
                        style: const TextStyle(
                            fontSize: 16.0, color: Color.fromRGBO(0, 0, 0, 1)),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      'Ingredientes:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color.fromRGBO(30, 30, 30, 0.5)),
                    ),
                    const SizedBox(height: 2.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          recent.ingredients.join(', '),
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

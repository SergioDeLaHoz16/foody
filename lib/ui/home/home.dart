import 'package:flutter/material.dart';
import 'package:foody/ui/pages/category/carrusel/carruselCategory.dart';
import 'package:foody/ui/pages/user/inventory.dart';
import 'package:foody/ui/pages/user/profile.dart';
import 'package:foody/ui/pages/user/recent/carrusel/carruselRecent.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // Índice de la página actual (inicio por defecto)

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var greeting = '';

    if (_currentIndex == 1) {
      // Mostrar "Buenos días" solo en la página de inicio
      if (now.hour < 12) {
        greeting = 'Buenos días';
      } else if (now.hour < 18) {
        greeting = 'Buenas tardes';
      } else {
        greeting = 'Buenas noches';
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Quitar la flecha de regreso
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.person,
                size: 34,
              ),
              onPressed: () {
                Get.to(const ProfilePage());
              },
            ),
            const SizedBox(width: 8), // Espacio entre el icono y el texto
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_currentIndex ==
                    1) // Mostrar el saludo solo en la página de inicio
                  const Text('Hola, Usuario', style: TextStyle(fontSize: 18)),
                Text(
                  greeting,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción para el botón de búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Acción para el botón de menú
            },
          ),
        ],
      ),
      body: _currentIndex == 0
          ? RecentPage() // Página de recetas
          : _currentIndex == 1
              ? HomePageContent() // Página de inicio (vacía)
              : InventoryScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Cambiar la página al hacer clic en un botón
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
        ],
      ),
    );
  }
}

class RecentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implementación de la página de recetas
    return const Center(
      child: Text('Página de Recetas'),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implementación de la página de inicio (vacía)
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Categorias",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    
                  ),
                  
                  CategoryCarousel(),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Recetas Recientes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: RecentCarousel(),
            )
          ],
        ),
      ),
    );
  }
}

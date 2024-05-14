import 'package:flutter/material.dart';
import 'package:foody/ui/pages/recipe/listRecent.dart';
import 'package:foody/ui/pages/user/profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/assets/images/profile.png'), // Reemplaza con la ruta de tu imagen
                      ),
                      SizedBox(height: 20),
                      Text(
                        'OzarPepi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8), // Espacio entre el icono y el texto
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          toolbarHeight: 150,
          backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfilePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(84, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 125),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'KumbhSans',
                      fontWeight: FontWeight.w700 // Tamaño de fuente del texto
                      ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color.fromARGB(255, 244, 255, 246)),
              child: const Text('Mi Perfil'),
            ),
            const SizedBox(height: 10), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(84, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 106),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'KumbhSans',
                      fontWeight: FontWeight.w700 // Tamaño de fuente del texto
                      ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color.fromARGB(255, 244, 255, 246)),
              child: const Text('Mis Favoritos'),
            ),
            const SizedBox(height: 10), // Espacio entre los botones

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRecipesPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(84, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 110),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'KumbhSans',
                      fontWeight: FontWeight.w700 // Tamaño de fuente del texto
                      ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color.fromARGB(255, 244, 255, 246)),
              child: const Text('Mis Recetas'),
            ),
            const SizedBox(height: 10), // Espacio entre los botones

            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //       foregroundColor: const Color.fromARGB(84, 0, 0, 0),
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 15, horizontal: 92),
            //       textStyle: const TextStyle(
            //           fontSize: 16,
            //           fontFamily: 'KumbhSans',
            //           fontWeight: FontWeight.w700 // Tamaño de fuente del texto
            //           ),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8)),
            //       backgroundColor: const Color.fromARGB(255, 244, 255, 246)),
            //   child: const Text('Configuraciones'),
            // ),
            const SizedBox(height: 10), // Espacio entre los botones

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(224, 255, 255, 255),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 105),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'KumbhSans',
                      fontWeight: FontWeight.w700 // Tamaño de fuente del texto
                      ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color.fromRGBO(31, 175, 63, 1)),
              child: const Text('Cerrar Sesion'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foody/ui/auth/newLoginPage.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  void _login() {
    setState(() {
      _validateEmail = _emailController.text.isEmpty;
      _validatePassword = _passwordController.text.isEmpty;
    });

    if (!_validateEmail && !_validatePassword) {
      // Implementa tu lógica de inicio de sesión con API o Firebase aquí
      // Navega a la siguiente página
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 50.0),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Foody",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(31, 175, 63, 1),
                ),
              ),
            ),
            const Text(
              "Controla tu despensa y planificas tus comidas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            const SizedBox(height: 100.0),
            Center(
              child: Image.asset(
                'assets/assets/images/Logo.png', // Reemplaza con el nombre de tu archivo de imagen
                width: 200.0, // Ajusta la anchura según sea necesario
                height: 150.0, // Ajusta la altura según sea necesario
              ),
            ),
            const SizedBox(height: 80.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Get.to(const NewLoginPage());
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 125),
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'KumbhSans',
                          fontWeight:
                              FontWeight.w700 // Tamaño de fuente del texto
                          ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: const Color.fromRGBO(31, 175, 63, 1)),
                  child: const Text('Iniciar Sesion'),
                ),
                const SizedBox(height: 10), // Espacio entre botones
                ElevatedButton(
                  onPressed: () {
                    Get.to(const NewLoginPage());
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 5, 5, 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 130),
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'KumbhSans',
                          fontWeight:
                              FontWeight.w700 // Tamaño de fuente del texto
                          ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor:
                          const Color.fromARGB(244, 255, 255, 255)),
                  child: const Text('Registrarse'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

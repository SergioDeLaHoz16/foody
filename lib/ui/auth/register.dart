import 'package:flutter/material.dart';
import 'package:foody/ui/auth/newLoginPage.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;
  bool _isPassswordVisible = false;

  void _registerPage() {
    setState(() {
      _validateEmail = _emailController.text.isEmpty;
      _validatePassword = _passwordController.text.isEmpty;
    });

    if (!_validateEmail && !_validatePassword) {
      // Implementa tu lógica de inicio de sesión con API o Firebase aquí
      // Navega a la siguiente página
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPassswordVisible = !_isPassswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  child: Transform.scale(
                    scale: 1.5, // Factor de escala
                    child: const Icon(
                      Icons.person_pin,
                      size: 100, // Tamaño original del icono
                      color: Color.fromRGBO(31, 175, 63, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Iniciar Sesion",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(height: 30.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText:
                          "Correo Electronico", // Quitado el salto de línea
                      alignLabelWithHint:
                          true, // Alinea el labelText con el texto ingresado
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(103, 30, 30, 46),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      errorText: _validatePassword
                          ? "Correo Electronico Obligatoria"
                          : null,
                      filled: true, // Activa el fondo del TextField
                      fillColor:
                          Colors.grey[200], // Color de fondo del TextField
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none, // Borrar bordes
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:
                        !_isPassswordVisible, // Usar el estado para ocultar/mostrar la contraseña
                    decoration: InputDecoration(
                      labelText: "Contraseña", // Quitado el salto de línea
                      alignLabelWithHint:
                          true, // Alinea el labelText con el texto ingresado
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(103, 30, 30, 46),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      errorText:
                          _validatePassword ? "Contraseña Obligatoria" : null,
                      filled: true, // Activa el fondo del TextField
                      fillColor:
                          Colors.grey[200], // Color de fondo del TextField
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none, // Borrar bordes
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 15),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPassswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey[600],
                        ),
                        onPressed:
                            _togglePasswordVisibility, // Alternar visibilidad de la contraseña
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText:
                        !_isPassswordVisible, // Usar el estado para ocultar/mostrar la contraseña
                    decoration: InputDecoration(
                      labelText:
                          "Confirmar Contraseña", // Quitado el salto de línea
                      alignLabelWithHint:
                          true, // Alinea el labelText con el texto ingresado
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(103, 30, 30, 46),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      errorText:
                          _validatePassword ? "Contraseña Obligatoria" : null,
                      filled: true, // Activa el fondo del TextField
                      fillColor:
                          Colors.grey[200], // Color de fondo del TextField
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none, // Borrar bordes
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 15),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPassswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey[600],
                        ),
                        onPressed:
                            _togglePasswordVisibility, // Alternar visibilidad de la contraseña
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Alineación a la derecha
                children: [
                  Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Color.fromRGBO(31, 175, 63, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 32), // Espacio entre el texto y el botón
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Alineación al centro
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                        2.0), // Añadir padding alrededor del botón
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Acción del botón de Google
                      },
                      icon: Image.asset(
                        'assets/assets/images/google_icon.png',
                        height: 24.0, // Altura de la imagen
                        width: 24.0, // Ancho de la imagen
                      ),
                      label: const Text('Google'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,

                        minimumSize:
                            const Size(100, 50), // Ancho mínimo y altura
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16), // Padding interno
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        2.0), // Añadir padding alrededor del botón
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Acción del botón de Facebook
                      },
                      icon: Image.asset(
                        'assets/assets/images/facebook_icon.png',
                        height: 24.0, // Altura de la imagen
                        width: 24.0, // Ancho de la imagen
                      ),
                      label: const Text('Facebook'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,

                        minimumSize:
                            const Size(100, 50), // Ancho mínimo y altura
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16), // Padding interno
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        2.0), // Añadir padding alrededor del botón
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Acción del botón de Mac
                      },
                      icon: Image.asset(
                        'assets/assets/images/mac_logo.png',
                        height: 24.0, // Altura de la imagen
                        width: 24.0, // Ancho de la imagen
                      ),
                      label: const Text('Mac'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,

                        minimumSize:
                            const Size(100, 50), // Ancho mínimo y altura
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16), // Padding interno
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                        fontWeight: FontWeight.w700,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color.fromRGBO(31, 175, 63, 1),
                    ),
                    child: const Text('Registrarse'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0), // Padding horizontal
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "¿Ya tienes cuenta?",
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0), // Padding a la derecha del botón
                          child: TextButton(
                            onPressed: () {
                              Get.to(const NewLoginPage());
                            },
                            child: const Text(
                              "Inicia Sesion",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(31, 175, 63, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

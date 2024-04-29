import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'KumbhSans', // Nombre de la familia de la fuente
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/assets/images/Main.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // Navegar a login.dart al hacer tap en la foto
              Get.to(const LoginPage());
            },
          ),
        ),
      ),
    );
  }
}

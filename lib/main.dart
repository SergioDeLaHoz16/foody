import 'package:flutter/material.dart';
import 'package:foody/ui/app.dart';
import 'package:foody/ui/auth/login.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
  Get.put(const LoginPage());
}

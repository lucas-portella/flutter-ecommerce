import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      title: 'Flutter Demo',
      initialRoute: LoginPage.route,
    );
  }
}

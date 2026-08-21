import 'package:ecommerce/pages/loginPage/login_page.dart';
import 'package:ecommerce/pages/loginPage/login_page_controller.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return LoginPageController();
          },
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          routes: AppRoutes.routes,
          title: 'Ecommerce',
          initialRoute: LoginPage.route,
        );
      },
    );
    // return MaterialApp(
    //   routes: AppRoutes.routes,
    //   title: 'Flutter Demo',
    //   initialRoute: LoginPage.route,
    // );
  }
}

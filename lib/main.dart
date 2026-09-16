import 'package:ecommerce/features/home/controllers/cart_controller.dart';
import 'package:ecommerce/features/home/controllers/home_page_controller.dart';
import 'package:ecommerce/features/home/controllers/products_by_category_controller.dart';
import 'package:ecommerce/pages/loginPage/pages/login_page.dart';
import 'package:ecommerce/pages/loginPage/controller/login_page_controller.dart';
import 'package:ecommerce/pages/signupPage/signup_page_controller.dart';
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
            return CartController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductsByCategoryController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return LoginPageController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SignupPageController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return HomePageController();
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

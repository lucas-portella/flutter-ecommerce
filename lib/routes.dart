import 'package:ecommerce/features/home/pages/cart_page.dart';
import 'package:ecommerce/features/home/pages/checkout_page.dart';
import 'package:ecommerce/features/home/pages/home_page.dart';
import 'package:ecommerce/features/home/pages/products_by_category_page.dart';
import 'package:ecommerce/pages/loginPage/pages/login_page.dart';
import 'package:ecommerce/pages/passwordRecoveryPage/password_recovery_page.dart';
import 'package:ecommerce/pages/signupPage/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    PasswordRecoveryPage.route: (context) => PasswordRecoveryPage(),
    HomePage.route: (context) => HomePage(),
    CartPage.route: (context) => CartPage(),
    ProductsByCategoryPage.route: (context) {
      final String categoryName =
          ModalRoute.of(context)!.settings.arguments as String;
      return ProductsByCategoryPage(categoryName: categoryName);
    },
    CheckoutPage.route: (context) => CheckoutPage(),
  };
}

import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
  };
}

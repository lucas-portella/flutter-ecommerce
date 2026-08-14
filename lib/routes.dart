import 'package:ecommerce/pages/loginPage/login_page.dart';
import 'package:ecommerce/pages/passwordRecoveryPage/password_recovery_page.dart';
import 'package:ecommerce/pages/signupPage/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    LoginPage.route: (context) => LoginPage(),
    SignupPage.route: (context) => SignupPage(),
    PasswordRecoveryPage.route: (context) => PasswordRecoveryPage(),
  };
}

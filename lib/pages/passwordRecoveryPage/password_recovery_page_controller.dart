import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPageController {
  PasswordRecoveryPageController();

  String _email = '';
  final RegExp _regexEmail = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
  );

  void setEmail(String email) {
    _email = email;
  }

  bool verificaEmail() {
    return _regexEmail.hasMatch(_email);
  }

  void showSnackBar(BuildContext context) {
    AnimatedSnackBar.material(
      'Código enviado com sucesso!',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: Duration(seconds: 3, milliseconds: 500),
    ).show(context);
  }
}

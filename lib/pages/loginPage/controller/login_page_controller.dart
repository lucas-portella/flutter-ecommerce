import 'package:ecommerce/pages/loginPage/model/user.dart';
import 'package:ecommerce/shared/exceptions/auth_exception.dart';
import 'package:flutter/material.dart';

class LoginPageController extends ChangeNotifier {
  LoginPageController();

  bool isLoading = false;
  bool _checkboxValue = false;
  final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  User? user;

  void changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    if (!key.currentState!.validate()) {
      throw ErrorDescription('Validação incorreta');
    }

    changeIsLoading(true);
    try {
      await _login();
      emailController.clear();
      senhaController.clear();
    } finally {
      changeIsLoading(false);
    }
  }

  void changeCheckboxValue() {
    _checkboxValue = !_checkboxValue;
    notifyListeners();
  }

  bool get checkboxValue {
    return _checkboxValue;
  }

  Future<void> _login() async {
    // simula o delay de uma chamada de API
    await Future.delayed(Duration(seconds: 2));
    if (emailController.text.trim() == 'lucasportella@hotmail.com' ||
        senhaController.text.trim() == '123456') {
      user = User(email: emailController.text, nome: 'Lucas Portella');
    } else {
      throw AuthException(message: 'E-mail ou senha incorretos');
    }
  }

  String? validateEmail() {
    if (!_emailRegex.hasMatch(emailController.text)) return 'E-mail inválido';

    return null;
  }

  String? validateSenha() {
    if (senhaController.text.length < 6) return 'Senha inválida';

    return null;
  }
}

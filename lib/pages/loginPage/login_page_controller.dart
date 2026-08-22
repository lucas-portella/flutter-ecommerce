import 'package:flutter/material.dart';

class User {
  final String nome;
  final String email;

  User({required this.nome, required this.email});
}

class LoginPageController extends ChangeNotifier {
  LoginPageController();

  bool isLoading = false;
  bool _checkboxValue = false;
  final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  User? user;

  Future<void> handleLogin() async {
    if (!key.currentState!.validate()) {
      throw ErrorDescription('Validação incorreta');
    }

    isLoading = true;
    notifyListeners();

    await _login();

    isLoading = false;
    notifyListeners();
    emailController.clear();
    senhaController.clear();
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

    user = User(email: emailController.text, nome: 'Lucas Portella');
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

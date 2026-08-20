import 'package:flutter/material.dart';

class SignupPageController {
  String _senha = '';
  String _confirmarSenha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  final _regexUmaLetraMaiuscula = RegExp(r'[A-Z]');
  final _regexUmaLetraMinuscula = RegExp(r'[a-z]');
  final _regexCaractereEspecial = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]');

  set senha(String senha) {
    _senha = senha;
    _validaBotao();
  }

  set confirmarSenha(String confirmarSenha) {
    _confirmarSenha = confirmarSenha;
    _validaBotao();
  }

  void changeCheckBoxValue() {
    isActiveCheckBox = !isActiveCheckBox;
    _validaBotao();
  }

  bool validaTamanhoSenha() {
    return _senha.length >= 6;
  }

  bool validaSenhaCaractereEspecial() {
    return _regexCaractereEspecial.hasMatch(_senha);
  }

  bool validaSenhaLetraMaiuscula() {
    return _regexUmaLetraMaiuscula.hasMatch(_senha);
  }

  bool validaSenhaLetraMinuscula() {
    return _regexUmaLetraMinuscula.hasMatch(_senha);
  }

  bool senhasCoincidem() {
    return _senha.isNotEmpty && _senha == _confirmarSenha;
  }

  String? validateNome() {
    return nomeController.text.isNotEmpty ? null : 'Nome incorreto';
  }

  String? validateEmail() {
    print(_emailRegex.hasMatch(emailController.text));
    return _emailRegex.hasMatch(emailController.text) ? null : 'Email inválido';
  }

  void _validaBotao() {
    if (isActiveCheckBox &&
        validaTamanhoSenha() &&
        validaSenhaCaractereEspecial() &&
        validaSenhaLetraMaiuscula() &&
        validaSenhaLetraMinuscula() &&
        senhasCoincidem()) {
      isActiveButton = true;
    } else {
      isActiveButton = false;
    }
  }

  Future<void> singup() async {
    await Future.delayed(Duration(seconds: 2));
  }
}

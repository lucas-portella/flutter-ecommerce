import 'package:flutter/material.dart';

class SignupPageController {
  bool isActiveButton = false;
  bool isActiveCheckBox = false;
  bool isLoading = false;
  bool hasErrorCheckbox = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();

  final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  final _regexUmaLetraMaiuscula = RegExp(r'[A-Z]');
  final _regexUmaLetraMinuscula = RegExp(r'[a-z]');
  final _regexCaractereEspecial = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]');

  void changeCheckBoxValue() {
    isActiveCheckBox = !isActiveCheckBox;
    hasErrorCheckbox = !isActiveCheckBox;
  }

  bool validaTamanhoSenha() {
    return senhaController.text.length >= 6;
  }

  bool validaSenhaCaractereEspecial() {
    return _regexCaractereEspecial.hasMatch(senhaController.text);
  }

  bool validaSenhaLetraMaiuscula() {
    return _regexUmaLetraMaiuscula.hasMatch(senhaController.text);
  }

  bool validaSenhaLetraMinuscula() {
    return _regexUmaLetraMinuscula.hasMatch(senhaController.text);
  }

  bool senhasCoincidem() {
    return senhaController.text.isNotEmpty &&
        senhaController.text == confirmacaoSenhaController.text;
  }

  String? validateNome() {
    return nomeController.text.isEmpty ? 'Nome incorreto' : null;
  }

  String? validateEmail() {
    return _emailRegex.hasMatch(emailController.text) ? null : 'Email inválido';
  }

  String? validateSenha() {
    bool result =
        validaSenhaCaractereEspecial() &&
        validaSenhaLetraMaiuscula() &&
        validaSenhaLetraMinuscula() &&
        validaTamanhoSenha();

    return result ? null : 'Senha inválida';
  }

  String? validateConfirmacaoSenha() {
    return senhasCoincidem() ? null : 'Senhas não coincidem';
  }

  Future<void> singup() async {
    await Future.delayed(Duration(seconds: 2));
  }
}

class LoginPageController {
  LoginPageController();

  String _email = '';
  String _senha = '';
  bool isLoading = false;
  bool _checkboxValue = false;

  void setEmail(String email) => _email = email;

  void setSenha(String senha) => _senha = senha;

  void changeCheckboxValue() => _checkboxValue = !_checkboxValue;

  bool get checkboxValue {
    return _checkboxValue;
  }

  bool habilitaLogin() {
    return _email.trim().isNotEmpty && _senha.trim().isNotEmpty;
  }

  Future<void> login() async {
    // simula o delay de uma chamada de API
    await Future.delayed(Duration(seconds: 2));
  }
}

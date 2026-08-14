class SignupPageController {
  String _email = '';
  String _nome = '';
  String _senha = '';
  String _confirmarSenha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  final _regexUmaLetraMaiuscula = RegExp(r'[A-Z]');
  final _regexUmaLetraMinuscula = RegExp(r'[a-z]');
  final _regexCaractereEspecial = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]');

  set nome(String nome) {
    _nome = nome;
    _validaBotao();
  }

  set email(String email) {
    _email = email;
    _validaBotao();
  }

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
}

class User {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptedTerms;
  final String? accessToken;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptedTerms,
    this.accessToken,
  });

  Map<String, dynamic> registerJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'acceptedTerms': acceptedTerms,
    };
  }
}

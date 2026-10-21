import 'dart:math';

class Token {
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  Token({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'tokenType': tokenType,
      'expiresIn': expiresIn,
    };
  }

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
      expiresIn: json['expiresIn'],
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String createdAt;
  final Token token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': {'id': id, 'name': name, 'email': email, 'createdAt': createdAt},
      'tokens': token.toJson(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      createdAt: json['user']['createdAt'],
      token: Token.fromJson(json['tokens']),
    );
  }
}

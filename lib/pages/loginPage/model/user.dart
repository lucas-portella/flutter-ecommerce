import 'dart:math';

class User {
  final String id;
  final String name;
  final String email;
  final String createdAt;
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': {'id': id, 'name': name, 'email': email, 'createdAt': createdAt},
      'tokens': {
        'accessToken': accessToken,
        'tokenType': tokenType,
        'expiresIn': expiresIn,
      },
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      createdAt: json['user']['createdAt'],
      accessToken: json['tokens']['accessToken'],
      tokenType: json['tokens']['tokenType'],
      expiresIn: json['user']['expiresIn'],
    );
  }
}

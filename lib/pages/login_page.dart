import 'package:ecommerce/pages/signup_page.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  bool isActiveButton = false;
  bool checkBoxValue = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;

    return Scaffold(
      // SafeArea desconta espaços do dispositivo (ex.: barra superior)
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 4,
            children: [
              Spacer(),
              Image.asset(
                'assets/images/cadiado.png',
                width: 125,
                height: 125,
                fit: BoxFit.contain,
              ),
              Text('+DevsEcomm', style: AppTextStyle.title),
              Spacer(flex: 2),
              AppTextField(
                hintText: 'email@dominio.com',
                onChanged: (value) {
                  setState(() => email = value);
                  print(email);
                },
              ),
              AppTextField(
                hintText: '**********',
                obscureText: true,
                onChanged: (value) {
                  setState(() => senha = value);
                  print(senha);
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue = !checkBoxValue;
                      });
                      print('Cliquei no checkbox');
                    },
                  ),
                  Text('Lembrar-me'),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () => {},
                    child: Text('Esqueci minha senha'),
                  ),
                ],
              ),
              AppElevatedButton(
                type: ButtonType.filled,
                onPressed: isActiveButton
                    ? () {
                        print('Cliquei em entrar');
                      }
                    : null,
                buttonText: 'Entrar',
              ),
              AppElevatedButton(
                type: ButtonType.outlined,
                onPressed: () => Navigator.pushNamed(
                  context,
                  SignupPage.route,
                  arguments: 'Vim da primeira tela',
                ),
                buttonText: 'Cadastrar-se',
              ),
              Spacer(flex: 2),
              GestureDetector(
                onTap: () => {print('Cliquei na linha')},
                // RichText: Aninhar textos e e modificar seu style
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Termos de Serviço',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' e ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'Política de Privacidade',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

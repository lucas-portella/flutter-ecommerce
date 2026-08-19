import 'package:ecommerce/pages/loginPage/login_page_controller.dart';
import 'package:ecommerce/pages/passwordRecoveryPage/password_recovery_page.dart';
import 'package:ecommerce/pages/signupPage/signup_page.dart';
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
  LoginPageController controller = LoginPageController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
  }

  Future<void> login() async {
    if (!key.currentState!.validate()) return;

    setState(() {
      controller.isLoading = true;
    });

    await controller.login();

    setState(() {
      controller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea desconta espaços do dispositivo (ex.: barra superior)
      body: Form(
        key: key,
        child: SafeArea(
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
                  validator: (value) {
                    return controller.validateEmail();
                  },
                  hintText: 'email@dominio.com',
                  onChanged: (value) {
                    setState(() => controller.setEmail(value));
                  },
                ),
                AppTextField(
                  validator: (value) {
                    return controller.validateSenha();
                  },
                  hintText: '**********',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() => controller.setSenha(value));
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: controller.checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          controller.changeCheckboxValue();
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
                      onPressed: () => Navigator.pushNamed(
                        context,
                        PasswordRecoveryPage.route,
                      ),
                      child: Text('Esqueci minha senha'),
                    ),
                  ],
                ),
                AppElevatedButton(
                  type: ButtonType.filled,
                  onPressed: () async {
                    await login();
                  },
                  buttonText: 'Entrar',
                  isLoading: controller.isLoading,
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
      ),
    );
  }
}

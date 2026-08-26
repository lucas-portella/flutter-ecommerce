import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce/features/home/pages/home_page.dart';
import 'package:ecommerce/pages/loginPage/controller/login_page_controller.dart';
import 'package:ecommerce/pages/passwordRecoveryPage/password_recovery_page.dart';
import 'package:ecommerce/pages/signupPage/signup_page.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/exceptions/auth_exception.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea desconta espaços do dispositivo (ex.: barra superior)
      body: Consumer<LoginPageController>(
        builder: (context, controller, child) {
          return Form(
            key: controller.key,
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
                      controller: controller.emailController,
                      validator: (value) {
                        return controller.validateEmail();
                      },
                      hintText: 'email@dominio.com',
                      // onChanged: (value) {
                      //   setState(() => controller.setEmail(value));
                      // },
                    ),
                    AppTextField(
                      controller: controller.senhaController,
                      validator: (value) {
                        return controller.validateSenha();
                      },
                      hintText: '**********',
                      obscureText: true,
                      // onChanged: (value) {
                      //   setState(() => controller.setSenha(value));
                      // },
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.checkboxValue,
                          onChanged: (value) {
                            controller.changeCheckboxValue();
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
                        try {
                          await controller.handleLogin();
                          if (!context.mounted) return;
                          Navigator.popAndPushNamed(context, HomePage.route);
                        } on AuthException catch (e) {
                          AnimatedSnackBar.material(
                            e.message,
                            type: AnimatedSnackBarType.error,
                            mobileSnackBarPosition:
                                MobileSnackBarPosition.bottom,
                            duration: Duration(seconds: 3, milliseconds: 500),
                          ).show(context);
                        }
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
          );
        },
      ),
    );
  }
}

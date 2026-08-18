import 'package:ecommerce/pages/signupPage/signup_page_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupPageController controller = SignupPageController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleSignup() async {
    setState(() {
      controller.isLoading = true;
    });

    await controller.singup();

    setState(() {
      controller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24,
            children: [
              Column(
                spacing: 2,
                children: [
                  Text('Criar uma conta', style: AppTextStyle.title),
                  Text(
                    'Insira seus dados para iniciar as compras',
                    style: AppTextStyle.subtitle,
                  ),
                ],
              ),
              AppTextField(
                hintText: 'email@dominio.com',
                onChanged: (value) {
                  setState(() {
                    controller.email = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'nome',
                onChanged: (value) {
                  setState(() {
                    controller.nome = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'senha',
                onChanged: (value) {
                  setState(() {
                    controller.senha = value;
                  });
                },
                obscureText: true,
              ),
              AppTextField(
                hintText: 'confirmar senha',
                onChanged: (value) {
                  setState(() {
                    controller.confirmarSenha = value;
                  });
                },
                obscureText: true,
              ),
              AppPasswordRequirement(
                isValidated: controller.validaTamanhoSenha(),
                label: 'Mínimo de 6 caracteres',
              ),
              AppPasswordRequirement(
                isValidated: controller.validaSenhaCaractereEspecial(),
                label: 'No mínimo um caractere especial',
              ),
              AppPasswordRequirement(
                isValidated: controller.validaSenhaLetraMaiuscula(),
                label: 'No mínimo uma letra maiúscula',
              ),
              AppPasswordRequirement(
                isValidated: controller.validaSenhaLetraMinuscula(),
                label: 'No mínimo uma letra minúscula',
              ),
              AppPasswordRequirement(
                isValidated: controller.senhasCoincidem(),
                label: 'As senhas coincidem',
              ),
              GestureDetector(
                onTap: () => print(
                  'Abrindo link para Termos de Serviço e Política de Privacidade',
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: controller.isActiveCheckBox,
                      onChanged: (value) {
                        setState(() {
                          controller.changeCheckBoxValue();
                        });
                      },
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Ao clicar em continuar, você concorda com\nos nossos Termos de Serviço e com a\nPolítica de Privacidade',
                            style: AppTextStyle.textSpan,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppElevatedButton(
                onPressed: controller.isActiveButton
                    ? () {
                        _handleSignup();
                      }
                    : null,
                buttonText: 'Continuar',
                type: ButtonType.filled,
                isLoading: controller.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

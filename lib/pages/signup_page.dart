import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static String route = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isActiveCheckbox = false;
  bool isActiveButton = false;
  String email = '';
  String nome = '';
  String senha = '';
  String confirmacaoSenha = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isActiveButton =
        isActiveCheckbox &&
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmacaoSenha.trim().isNotEmpty;

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
                    email = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'nome',
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'senha',
                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              AppTextField(
                hintText: 'confirmar senha',
                onChanged: (value) {
                  setState(() {
                    confirmacaoSenha = value;
                  });
                },
              ),
              Spacer(),
              GestureDetector(
                onTap: () => print(
                  'Abrindo link para Termos de Serviço e Política de Privacidade',
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: isActiveCheckbox,
                      onChanged: (value) {
                        setState(() {
                          isActiveCheckbox = !isActiveCheckbox;
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
                onPressed: isActiveButton ? () {} : null,
                buttonText: 'Continuar',
                type: ButtonType.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

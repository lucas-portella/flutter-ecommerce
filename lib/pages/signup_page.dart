import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static String route = '/signup';

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
              AppTextField(hintText: 'email@dominio.com'),
              AppTextField(hintText: 'nome'),
              AppTextField(hintText: 'senha'),
              AppTextField(hintText: 'confirmar senha'),
              Spacer(),
              GestureDetector(
                onTap: () => print(
                  'Abrindo link para Termos de Serviço e Política de Privacidade',
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Ao clicar em continuar, você concorda com os nossos ',
                        style: AppTextStyle.textSpan,
                      ),
                      TextSpan(
                        text: 'Termos de Serviço ',
                        style: AppTextStyle.highlightedTextSpan,
                      ),
                      TextSpan(text: 'e com a ', style: AppTextStyle.textSpan),
                      TextSpan(
                        text: 'Política de Privacidade ',
                        style: AppTextStyle.highlightedTextSpan,
                      ),
                    ],
                  ),
                ),
              ),
              AppElevatedButton(
                onPressed: () => {},
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

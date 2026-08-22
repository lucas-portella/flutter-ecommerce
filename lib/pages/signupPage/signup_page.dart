import 'package:ecommerce/pages/signupPage/signup_page_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_checkbox.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_password_requirement.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          child: Consumer<SignupPageController>(
            builder: (context, controller, child) {
              return Form(
                key: controller.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
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
                      controller: controller.emailController,
                      validator: (value) {
                        return controller.validateEmail();
                      },
                      hintText: 'email@dominio.com',
                      // onChanged: (value) {
                      //   setState(() {
                      //     controller.email = value;
                      //   });
                      // },
                    ),
                    AppTextField(
                      controller: controller.nomeController,
                      validator: (value) {
                        return controller.validateNome();
                      },
                      hintText: 'nome',
                      // onChanged: (value) {
                      //   setState(() {
                      //     controller.nome = value;
                      //   });
                      // },
                    ),
                    AppTextField(
                      onChanged: (value) {
                        controller.rebuild();
                      },
                      controller: controller.senhaController,
                      hintText: 'senha',
                      validator: (value) {
                        return controller.validateSenha();
                      },
                      // onChanged: (value) {
                      //   setState(() {
                      //     controller.senha = value;
                      //   });
                      // },
                      obscureText: true,
                    ),
                    AppTextField(
                      onChanged: (value) {
                        controller.rebuild();
                      },
                      hintText: 'confirmar senha',
                      controller: controller.confirmacaoSenhaController,
                      validator: (value) {
                        return controller.validateConfirmacaoSenha();
                      },
                      // onChanged: (value) {
                      //   setState(() {
                      //     controller.confirmarSenha = value;
                      //   });
                      // },
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
                    Spacer(),
                    GestureDetector(
                      onTap: () => print(
                        'Abrindo link para Termos de Serviço e Política de Privacidade',
                      ),
                      child: Row(
                        children: [
                          AppCheckbox(
                            hasError: controller.hasErrorCheckbox,
                            value: controller.isActiveCheckBox,
                            onChanged: (value) {
                              controller.changeCheckBoxValue();
                              controller.rebuild();
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
                      onPressed: () async {
                        await controller.handleSignup();
                      },
                      buttonText: 'Continuar',
                      type: ButtonType.filled,
                      isLoading: controller.isLoading,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

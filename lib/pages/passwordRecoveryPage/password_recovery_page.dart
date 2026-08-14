import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});
  static final String route = '/passwordRecovery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            spacing: 8,
            children: [
              Text('Recuperar senha', style: AppTextStyle.title),
              AppTextField(hintText: 'email@dominio.com'),
              Spacer(),
              AppElevatedButton(
                onPressed: () {
                  AnimatedSnackBar.material(
                    'Código enviado com sucesso!',
                    type: AnimatedSnackBarType.success,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                    duration: Duration(seconds: 3, milliseconds: 500),
                  ).show(context);
                },
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

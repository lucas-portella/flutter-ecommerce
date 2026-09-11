import 'package:ecommerce/pages/passwordRecoveryPage/password_recovery_page_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:ecommerce/shared/widgets/app_elevated_button.dart';
import 'package:ecommerce/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});
  static final String route = '/passwordRecovery';

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  PasswordRecoveryPageController controller = PasswordRecoveryPageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              Text('Recuperar senha', style: AppTextStyle.title),
              AppTextField(
                hintText: 'email@dominio.com',
                onChanged: (value) {
                  setState(() {
                    controller.setEmail(value);
                  });
                },
              ),
              Spacer(),
              AppElevatedButton(
                onPressed: controller.verificaEmail()
                    ? () {
                        controller.showSnackBar(context);
                      }
                    : null,
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

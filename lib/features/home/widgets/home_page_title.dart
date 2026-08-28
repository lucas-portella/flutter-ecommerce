import 'package:ecommerce/pages/loginPage/controller/login_page_controller.dart';
import 'package:ecommerce/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginPageController>(
      builder: (context, loginController, child) {
        return Text(
          'Olá, ${loginController.user!.nome}',
          style: AppTextStyle.homePageTitle,
        );
      },
    );
  }
}

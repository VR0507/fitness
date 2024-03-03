import 'package:fitness/controllers/login_controller.dart';
import 'package:fitness/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
class LoginScreen extends ShyWidget{
  final controller= Get.put(LoginController());

   LoginScreen({super.key});
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: SocialLoginButton(
          buttonType: SocialLoginButtonType.google,
          onPressed: () =>controller.loginWithGoogle(),
        ),),
      ),

    );
  }

}
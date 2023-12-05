// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  void validateAndLogin() {
    if (validateFields()) {
      saveLoginInfo();
      Get.toNamed(Routes.HOME);
    }
  }

  bool validateFields() {
    String login = loginController.text.trim();
    String password = passwordController.text.trim();

    if (login.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Erro',
        'Preencha todos os campos.',
        backgroundColor: Colors.white,
      );
      return false;
    }

    if (password.length < 2) {
      Get.snackbar(
        'Erro',
        'A senha deve ter pelo menos 2 caracteres.',
        backgroundColor: Colors.white,
      );
      return false;
    }

    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regex.hasMatch(password)) {
      Get.snackbar(
        'Erro',
        'A senha não pode conter caracteres especiais.',
        backgroundColor: Colors.white,
      );
      return false;
    }

    if (login.length > 20 || password.length > 20) {
      Get.snackbar(
        'Erro',
        'Os campos não podem ter mais de 20 caracteres.',
        backgroundColor: Colors.white,
      );
      return false;
    }

    if (login.endsWith(' ') || password.endsWith(' ')) {
      Get.snackbar(
        'Erro',
        'Os campos não podem terminar com espaço.',
        backgroundColor: Colors.white,
      );
      return false;
    }

    return true;
  }

  void saveLoginInfo() async {}

  void launchPrivacyPolicy() async {
    const url = 'https://www.google.com.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Erro',
        'Não foi possível abrir a política de privacidade.',
        backgroundColor: Colors.white,
      );
    }
  }
}

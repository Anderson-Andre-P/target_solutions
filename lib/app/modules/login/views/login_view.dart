import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF09A785),
              Color(0xFF1AC79B),
            ],
            transform: GradientRotation(90),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: controller.loginController,
                labelText: 'Login',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: controller.passwordController,
                labelText: 'Senha',
                isPassword: true,
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.validateAndLogin();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green, // Cor do texto
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                  ),
                ),
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 60),
              InkWell(
                onTap: () {
                  launchPrivacyPolicy();
                },
                child: const Text(
                  'Política de Privacidade',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void launchPrivacyPolicy() async {
    controller.launchPrivacyPolicy();
  }
}

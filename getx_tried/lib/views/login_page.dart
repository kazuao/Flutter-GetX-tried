import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tried/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LOGIN')),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('login'),
              onPressed: () {
                return controller.login(
                  controller.emailController.text,
                  controller.passwordController.text,
                );
              },
            ),
            const SizedBox(height: 30),
            Obx(() {
              final textColor = controller.status.value == FormStatus.error
                  ? Colors.red
                  : null;
              return Text(
                controller.message.value,
                style: TextStyle(color: textColor),
              );
            })
          ],
        ),
      ),
    );
  }
}

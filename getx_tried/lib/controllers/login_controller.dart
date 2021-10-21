import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FormStatus {
  idle,
  loading,
  error,
  success,
}

class LoginController extends GetxController {
  final message = 'Please fill out the form.'.obs;
  final status = (FormStatus.idle).obs;

  final emailController = TextEditingController(text: 'oreore@ore.com');
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    status.listen((status) {
      if (status == FormStatus.success) {
        Get.offNamed('data');
      }
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login(String email, String password) async {
    status(FormStatus.idle); // 初期化

    message('Checking inputs...');
    await wait(seconds: 1);

    _validate(email.trim(), password.trim()); // 検証失敗でerror

    // エラーが出なかった場合
    if (status.value == FormStatus.idle) {
      status(FormStatus.loading);
      message('OK. Loading screen...');
      await wait(seconds: 1);

      status(FormStatus.success); // ログイン成功 → 画面遷移
    }
  }

  void _validate(String email, String password) {
    final isNotEmail = !GetUtils.isEmail(email);
    final isNotPassword = password.length < 8;
    if (isNotEmail || isNotPassword) {
      status(FormStatus.error);
      message('Invalid email or password');
    }
  }
}

Future<void> wait({required int seconds}) async {
  await Future.delayed(Duration(seconds: seconds));
}

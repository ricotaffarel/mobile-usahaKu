import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:usahaku/app/data/controller/user_controller.dart';

import '../../../data/providers/services.dart';

class LoginController extends GetxController {
  var user = Get.find<UserController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // cekSession();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    if (!(emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty)) {
      Get.snackbar(
        'Email dan Password masih kosong',
        'Harap isi terlabih dahulu email dan password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        animationDuration: const Duration(milliseconds: 700),
      );
    } else {
      // await UserProvider().login(
      //     emailController.text, passwordController.text);
      // Get.toNamed(Routes.HOME);
      await user.login(
          emailController.text.trim(), passwordController.text.trim());
      debugPrint("namaku1: ${user.user.value?.name}");
      // debugPrint("namaku2: ${UserProvider().user.value?.name!}");
    }
  }
}

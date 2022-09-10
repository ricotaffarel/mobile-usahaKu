import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/extensions/extensions.dart';

import '../../../data/controller/user_controller.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final isPasswordEigthCharacter = false.obs;
  final userController = Get.find<UserController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final count = 0.obs;
  var birthday = Rxn<DateTime>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> register() async {
    if (!(nameController.text.isNotEmpty &&
        birthday.value != null &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty)) {
      Get.snackbar(
        'Data masih kosong',
        'Harap isi terlabih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        animationDuration: const Duration(milliseconds: 700),
      );
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
      debugPrint(nameController.text);
    } else {
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
      debugPrint(nameController.text);
      // await UserProvider().login(
      //     emailController.text, passwordController.text);
      // Get.toNamed(Routes.HOME);
      await userController.register(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
          birthday.value!.datePost);
    }
  }

  onChangePassword(String password) {
    isPasswordEigthCharacter.value = false;
    if (password.length >= 8) isPasswordEigthCharacter.value = true;
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/extensions/extensions.dart';

import '../../../../data/controller/user_controller.dart';
import '../../../../shared/shared.dart';

class ProfileController extends GetxController {
  final userController = Get.find<UserController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var birthday = Rxn<DateTime>();
  var selectedGender = Rxn<String>();
  List<String> genders = ['Laki-Laki', 'Perempuan'];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    nameController.text = userController.user.value!.name!;
    emailController.text = userController.user.value!.email!;
    birthday.value = DateTime.parse(userController.user.value!.birthday!);
    selectedGender.value = userController.user.value!.jenisKelamin;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> updatePhotoProfile(BuildContext context) async {
    File? result = await getSingleImage(context);
    if (result != null) {
      await userController.updatePPUser(result);
    }
  }

  void save() async {
    if (!(nameController.text.trim() != "" &&
        emailController.text.trim() != "" &&
        passwordController.text.trim() != "" &&
        selectedGender.value != null &&
        birthday.value != null)) {
      snackbarCustom(
        typeSnackbar: TypeSnackbar.info,
        title: "Terdapat Data Kosong",
        message: "Harap untuk pastikan seluruh data telah terisi",
      );
    } else {
      await userController.updateUser(
          nameController.text,
          emailController.text,
          passwordController.text,
          birthday.value!.datePost,
          selectedGender.value.toString());
          passwordController.text = "";
    }
  }
}

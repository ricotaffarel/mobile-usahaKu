import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/data/controller/roles_controller.dart';
import 'package:usahaku/app/data/controller/user_controller.dart';
import 'package:usahaku/app/extensions/extensions.dart';

import '../../../../shared/shared.dart';

class DataUserAdminController extends GetxController {
  var rolesController = Get.put(RolesController());
  var userController = Get.find<UserController>();

  final isPasswordEigthCharacter = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var birthday = Rxn<DateTime>();
  var selectedGender = Rxn<String>();
  List<String> genders = ['Laki-Laki', 'Perempuan'];
  var selectedStatusUser = Rxn<String>();
  List<String> statusUser = ['Aktif', 'Tidak Aktif'];

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await userController.getUser();
    await rolesController.getRoles();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChangePassword(String password) {
    isPasswordEigthCharacter.value = false;
    if (password.length >= 8) isPasswordEigthCharacter.value = true;
  }

  Future<void> createUser() async {
    if (!(nameController.text.isNotEmpty &&
        rolesController.selectedRoles.value != null &&
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
    } else {
      await userController.createUser(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
          rolesController.selectedRoles.value!.id!,
          birthday.value!.datePost);
      emailController.text = "";
      nameController.text = "";
      passwordController.text = "";
      birthday.value = null;
      selectedGender.value = null;
      rolesController.selectedRoles.value = null;
      isPasswordEigthCharacter.value = false;
      await userController.getUser();
    }
  }

  Future<void> updateDataUser() async {
    if (!(nameController.text.trim() != "" &&
        emailController.text.trim() != "" &&
        rolesController.selectedRoles.value != null &&
        selectedGender.value != null &&
        birthday.value != null &&
        selectedStatusUser.value != null)) {
      snackbarCustom(
        typeSnackbar: TypeSnackbar.info,
        title: "Terdapat Data Kosong",
        message: "Harap untuk pastikan seluruh data telah terisi",
      );
    } else {
      await userController.updateDataUser(
          nameController.text,
          emailController.text,
          rolesController.selectedRoles.value!.id!,
          birthday.value!.datePost,
          selectedGender.value.toString(),
          selectedStatusUser.value.toString());
      emailController.text = "";
      nameController.text = "";
      birthday.value = null;
      selectedGender.value = null;
      rolesController.selectedRoles.value = null;
      await userController.getUser();
    }
  }

  Future<void> updateDataPwUser() async {
    if (!(passwordController.text.trim() != "" &&
        emailController.text.trim() != "")) {
      snackbarCustom(
        typeSnackbar: TypeSnackbar.info,
        title: "Terdapat Data Kosong",
        message: "Harap untuk pastikan seluruh data telah terisi",
      );
    } else {
      await userController.updateDataPwUser(
        emailController.text,
        passwordController.text,
      );
      emailController.text = "";
      passwordController.text = "";
      isPasswordEigthCharacter.value = false;
      await userController.getUser();
    }
  }

  void increment() => count.value++;
}

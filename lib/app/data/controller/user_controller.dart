import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/data/providers/services.dart';
import 'package:usahaku/app/shared/shared.dart';

import '../../routes/app_pages.dart';
import '../models/user.dart';

class UserController extends GetxController with StateMixin {
  var dataUser = List<User>.empty().obs;
  var user = Rxn<User>();

  Future<void> login(String email, String password) async {
    change(null, status: RxStatus.loading());
    showLoading();

    var result = await UserProvider().login(email, password);
    if (result.value != null) {
      await getMe();
      debugPrint("nama : ${user.value?.email}");
      debugPrint("nama : ${user.value?.name}");
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Login Failed',
        message: "Please check your email and password",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> register(
      String name, String email, String password, String birthday) async {
    change(null, status: RxStatus.loading());
    showLoading();

    var result = await UserProvider().register(name, email, password, birthday);
    if (result.value != null) {
      EasyLoading.dismiss();
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Register Failed',
        message: "Please check your email",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> createUser(String name, String email, String password,
      int rolesId, String birthday) async {
    change(null, status: RxStatus.loading());
    showLoading();

    var result = await UserProvider()
        .createUser(name, email, password, rolesId, birthday);
    if (result.value != null) {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Berhasil Tambah Data',
        message: "Data User Telah Ditambahkan",
        typeSnackbar: TypeSnackbar.success,
      );
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Gagal Tambah User',
        message: "Silahkan Coba Kembali",
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> getMe() async {
    change(null, status: RxStatus.loading());
    showLoading();
    var result = await UserProvider().getMe();
    if (result.value != null) {
      user.value = result.value;
      user.refresh();
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }

  Future<void> updateUser(String name, String email, String password,
      String birthday, String jenisKelamin) async {
    change(null, status: RxStatus.loading());
    showLoading();
    var result = await UserProvider()
        .updateUser(name, email, password, birthday, jenisKelamin);
    if (result.value != null) {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Update Profile Berhasil',
        message: "Data Berhasil Disimpan",
        typeSnackbar: TypeSnackbar.success,
      );
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Update Profile Gagal',
        message: 'Silahkan Coba Kembali',
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> updatePPUser(File photo) async {
    showLoading();
    var result = await UserProvider().updatePPUser(photo);
    if (result.value != null) {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Update Photo Berhasil',
        message: "Data Berhasil Disimpan",
        typeSnackbar: TypeSnackbar.success,
      );
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Update Photo Gagal',
        message: result.message!,
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> getUser() async {
    showLoading();
    var result = await UserProvider().getUser();
    if (result.value != null) {
      dataUser.value = result.value;
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Berhasil memuat data',
        message: "Success",
        typeSnackbar: TypeSnackbar.success,
      );
    } else {
      EasyLoading.dismiss();
      snackbarCustom(typeSnackbar: TypeSnackbar.error, message: "No Messege");
    }
  }

  Future<void> updateDataUser(String name, String email, int rolesId,
      String birthday, String jenisKelamin, String status) async {
    change(null, status: RxStatus.loading());
    showLoading();
    var result = await UserProvider()
        .updateDataUser(name, email, rolesId, birthday, jenisKelamin, status);
    if (result.value != null) {
      EasyLoading.dismiss();
      debugPrint(result.toString());
      snackbarCustom(
        title: 'Update Profile Berhasil',
        message: "Data Berhasil Disimpan",
        typeSnackbar: TypeSnackbar.success,
      );
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Update Profile Gagal',
        message: 'Silahkan Coba Kembali',
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }

  Future<void> updateDataPwUser(String email, String password,) async {
    change(null, status: RxStatus.loading());
    showLoading();
    var result = await UserProvider()
        .updateDataPwUser(email, password);
    if (result.value != null) {
      EasyLoading.dismiss();
      debugPrint(result.toString());
      snackbarCustom(
        title: 'Update Password User Berhasil',
        message: "Data Berhasil Disimpan",
        typeSnackbar: TypeSnackbar.success,
      );
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
        title: 'Update Password User Gagal',
        message: 'Silahkan Coba Kembali',
        typeSnackbar: TypeSnackbar.error,
      );
    }
  }
}

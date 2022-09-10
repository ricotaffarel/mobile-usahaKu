import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/data/models/address.dart';
import 'package:usahaku/app/data/providers/services.dart';
import 'package:usahaku/app/shared/shared.dart';

class AddressController extends GetxController with StateMixin {
  var dataAddress = List<Address>.empty().obs;
  var dataProvinces = List<Province>.empty().obs;
  var selectedProvince = Rxn<Province>();
  var dataCity = List<City>.empty().obs;
  var selectedCity = Rxn<City>();
  var dataDistrict = List<District>.empty().obs;
  var selectedDistrict = Rxn<District>();
  var dataVillage = List<Village>.empty().obs;
  var selectedVillage = Rxn<Village>();

  Future<void> getProvince() async {
    var result = await AddressProvider().getProvinces();

    if (result.value != null) {
      dataProvinces.value = result.value;
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.error,
          message: result.message ?? "No Messege");
    }
  }

  Future<void> getCity(String code) async {
    var result = await AddressProvider().getCity(code);

    if (result.value != null) {
      dataCity.value = result.value;
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.error,
          message: result.message ?? "No Messege");
    }
  }

  Future<void> getDistrict(String code) async {
    var result = await AddressProvider().getDistrict(code);

    if (result.value != null) {
      dataDistrict.value = result.value;
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.error,
          message: result.message ?? "No Messege");
    }
  }

  Future<void> getVillage(String code) async {
    var result = await AddressProvider().getVillage(code);

    if (result.value != null) {
      dataVillage.value = result.value;
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.error,
          message: result.message ?? "No Messege");
    }
  }

  Future<void> getAddress() async {
    showLoading();
    var result = await AddressProvider().getAddress();

    if (result.value != null) {
      dataAddress.value = result.value;
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      snackbarCustom(
          typeSnackbar: TypeSnackbar.error,
          message: result.message ?? "No Messege");
    }
  }
  
}

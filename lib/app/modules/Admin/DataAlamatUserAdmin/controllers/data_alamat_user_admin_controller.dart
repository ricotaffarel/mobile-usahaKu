import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:usahaku/app/data/controller/address_controller.dart';

class DataAlamatUserAdminController extends GetxController {
  var addressController = Get.put(AddressController());

  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailAddressController = TextEditingController();
  Position? position;
  late final MapController mapController;

  var lat = Rxn<String>();
  var long = Rxn<String>();

  final count = 0.obs;
  final address = ''.obs;
  @override
  void onInit() async {
    super.onInit();
    await addressController.getProvince();
    await addressController.getAddress();
    mapController = MapController();
    // await addressController.getCity(addressController.selectedProvince.value!.code.toString());
    // await addressController.getDistrict(addressController.selectedCity.value!.code.toString());
    // await addressController.getVillage(addressController.selectedDistrict.value!.code.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<Position> DeterminePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // await Geolocator.openLocationSettings();
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // return Future.error(
      // 'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];

    address.value =
        '${place.country}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.locality}, ${place.subLocality}, ${place.postalCode}';
  }

  Future<void> createAddress() async {
    if (nameController.text.isEmpty) {
      Get.snackbar(
        'Data nama kosong',
        'Harap isi terlabih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        animationDuration: const Duration(milliseconds: 700),
      );
    } else if (titleController.text.isEmpty) {
      Get.snackbar(
        'Data title kosong',
        'Harap isi terlabih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        animationDuration: const Duration(milliseconds: 700),
      );
    } else if (detailAddressController.text.isEmpty) {
      Get.snackbar(
        'Alamat Lengkap kosong',
        'Harap isi terlabih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        animationDuration: const Duration(milliseconds: 700),
      );
    } else if (addressController.selectedProvince.value!.code!.isEmpty &&
        addressController.selectedCity.value!.code!.isEmpty &&
        addressController.selectedDistrict.value!.code!.isEmpty &&
        addressController.selectedVillage.value!.code!.isEmpty) {
      Get.snackbar(
        'Provinsi, Kota, Kecamatan, Desa masih kosong',
        'Harap isi terlabih dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        animationDuration: const Duration(milliseconds: 700),
      );
    } else {}
  }
}

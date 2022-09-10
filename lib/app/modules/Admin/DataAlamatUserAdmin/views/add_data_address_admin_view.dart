// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get_cli/common/utils/json_serialize/json_ast/json_ast.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/data/models/address.dart';
import 'package:usahaku/app/modules/Admin/DataAlamatUserAdmin/controllers/data_alamat_user_admin_controller.dart';
import '../../../../shared/shared.dart';

class AddDataAddressAdminView extends GetView<DataAlamatUserAdminController> {
  var adminController = Get.find<DataAlamatUserAdminController>();

  AddDataAddressAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tambah Data Alamat",
                    style: blueTextFontBold,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 40,
                    controller: adminController.nameController,
                    hint: 'Masukan Nama',
                    title: 'Nama',
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z1-9 ]')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 40,
                    controller: adminController.titleController,
                    hint: 'cnth. Alamat Rumah Fulan',
                    title: 'Title',
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z1-9 ]')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 40,
                    controller: adminController.detailAddressController,
                    hint: 'Masukan Detail Aalamat',
                    title: 'Detail Alamat',
                    obscureText: true,
                    inputFormater: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => Column(
                          children: [
                            DropDownWidget(
                              title: "Province",
                              value: adminController.addressController
                                  .selectedProvince.value?.name,
                              list: adminController
                                  .addressController.dataProvinces
                                  .map((element) => element.name!)
                                  .toList(),
                              result: (value) async {
                                adminController.addressController.selectedCity
                                    .value = null;
                                Province selectedProvince = adminController
                                    .addressController.dataProvinces
                                    .firstWhere(
                                        (element) => element.name == value);
                                adminController.addressController
                                    .selectedProvince.value = selectedProvince;
                                await adminController.addressController.getCity(
                                    adminController.addressController
                                        .selectedProvince.value!.code
                                        .toString());
                              },
                              hint: "Pilih Province",
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => Column(
                          children: [
                            DropDownWidget(
                              title: "City",
                              value: adminController
                                  .addressController.selectedCity.value?.name,
                              list: adminController.addressController.dataCity
                                  .map((element) => element.name!)
                                  .toList(),
                              result: (value) {
                                adminController.addressController
                                    .selectedDistrict.value = null;
                                City selectedCity = adminController
                                    .addressController.dataCity
                                    .firstWhere(
                                        (element) => element.name == value);
                                adminController.addressController.selectedCity
                                    .value = selectedCity;
                                adminController.addressController.getDistrict(
                                    adminController.addressController
                                        .selectedCity.value!.code
                                        .toString());
                              },
                              hint: "Pilih City",
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => Column(
                          children: [
                            DropDownWidget(
                              title: "District",
                              value: adminController.addressController
                                  .selectedDistrict.value?.name,
                              list: adminController
                                  .addressController.dataDistrict
                                  .map((element) => element.name!)
                                  .toList(),
                              result: (value) {
                                adminController.addressController
                                    .selectedVillage.value = null;
                                District selectedDistrict = adminController
                                    .addressController.dataDistrict
                                    .firstWhere(
                                        (element) => element.name == value);
                                adminController.addressController
                                    .selectedDistrict.value = selectedDistrict;
                                adminController.addressController.getVillage(
                                    adminController.addressController
                                        .selectedDistrict.value!.code
                                        .toString());
                              },
                              hint: "Pilih District",
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => Column(
                          children: [
                            DropDownWidget(
                              title: "Village",
                              value: adminController.addressController
                                  .selectedVillage.value?.name,
                              list: adminController
                                  .addressController.dataVillage
                                  .map((element) => element.name!)
                                  .toList(),
                              result: (value) {
                                Village selectedVillage = adminController
                                    .addressController.dataVillage
                                    .firstWhere(
                                        (element) => element.name == value);
                                adminController.addressController
                                    .selectedVillage.value = selectedVillage;
                              },
                              hint: "Pilih District",
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: Get.width - 50,
                        child: FlutterMap(
                          mapController: controller.mapController,
                          options: MapOptions(
                              minZoom: 5,
                              maxZoom: 18,
                              zoom: 15,
                              center: controller.position != null
                                  ? LatLng(controller.position!.latitude,
                                      controller.position!.longitude)
                                  : LatLng(-6.121435, 106.774124)),
                          layers: [
                            TileLayerOptions(
                                urlTemplate:
                                    'https://api.mapbox.com/styles/v1/rico1234/cl7lm8vid000114pcx04lvqxh/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmljbzEyMzQiLCJhIjoiY2w3bGxqb3BkMDRmaDNvbzMzdzhpYjRnZyJ9.DHAbZxYpjebvJ9enJEx8DQ',
                                additionalOptions: {
                                  'accessToken':
                                      'pk.eyJ1IjoicmljbzEyMzQiLCJhIjoiY2w3bGxqb3BkMDRmaDNvbzMzdzhpYjRnZyJ9.DHAbZxYpjebvJ9enJEx8DQ',
                                  'id': 'mapbox.mapbox-streets-v8',
                                }),
                            MarkerLayerOptions(markers: [
                              Marker(
                                  width: 80,
                                  height: 80,
                                  point: controller.position != null
                                      ? LatLng(controller.position!.latitude,
                                          controller.position!.longitude)
                                      : LatLng(-6.121435, 106.774124),
                                  builder: (ctx) => Container(
                                          child: Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 40,
                                      )))
                            ]),
                          ],
                        ),
                      ),
                      controller.address.value == ''
                          ? Container(
                              margin: const EdgeInsets.only(top: 140, left: 125),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 120,
                              height: 50,
                              child: ListView(
                                children: [
                                  Text(
                                    controller.address.value,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomSmallButtonWidget(
                      width: Get.width * 0.25,
                      onTap: () async {
                        controller.position =
                            await controller.DeterminePosition();
                        controller.mapController.move(
                            LatLng(controller.position!.latitude,
                                controller.position!.longitude),
                            18);
                        controller.GetAddress(controller.position!);
                        print(controller.position!.latitude);
                      },
                      title: "Atur Posisi"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonWidget(
                      width: Get.width - 40,
                      title: "Add User",
                      onTap: () async {
                        // await adminController.createUser();
                        adminController.count.value = 0;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}

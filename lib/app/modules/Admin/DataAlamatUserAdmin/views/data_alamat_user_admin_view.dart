import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/modules/Admin/DataAlamatUserAdmin/views/add_data_address_admin_view.dart';

import '../../../../shared/shared.dart';
import '../controllers/data_alamat_user_admin_controller.dart';

class DataAlamatUserAdminView extends GetView<DataAlamatUserAdminController> {
  DataAlamatUserAdminView({Key? key}) : super(key: key);
  // var addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        onRefresh: () async {
          await controller.addressController.getAddress();
          controller.count.value = 0;
        },
        backgroundColor: color,
        drawer: NavigationDrawerWidgetAdmin(),
        statusBarColor: const Color.fromRGBO(50, 70, 205, 1),
        customAppBar: AppBar(
          backgroundColor: const Color.fromRGBO(50, 70, 205, 1),
          title: Text(
            "Kelola Data User",
            style: whiteTextFontBig,
          ),
        ),
        floatingButton: FloatingActionButton(
          onPressed: () async {
            // await controller.addressController.getProvince();
            Get.bottomSheet(
              AddDataAddressAdminView(),
            );
            // // showCupertinoModalPopup(
            // //     context: context,
            // //     builder: (context) => const AddDataUserAdminView());
          },
          backgroundColor: const Color.fromRGBO(50, 70, 205, 1),
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Container(
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: const BoxDecoration(color: accentColor1),
                  child: Text(
                    'Note. Saat Update Data User Wajib Diisi Semua',
                    style: blackTextFontBold,
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(() => DataTable(
                            columns: const [
                              DataColumn(label: Text("#")),
                              DataColumn(label: Text("Nama")),
                              DataColumn(label: Text("title")),
                              DataColumn(label: Text("Detail Address")),
                              DataColumn(label: Text("Province")),
                              DataColumn(label: Text("City")),
                              DataColumn(label: Text("District")),
                              DataColumn(label: Text("Village")),
                              DataColumn(label: Text("Action")),
                            ],
                            rows: controller.addressController.dataAddress.value
                                .map((e) => DataRow(cells: [
                                      DataCell(Text(
                                          "${controller.count.value = controller.count.value + 1}")),
                                      DataCell(SizedBox(
                                          width: Get.width * 0.2,
                                          child: Text(e.name.toString()))),
                                      DataCell(Text(e.title.toString())),
                                      DataCell(
                                          Text(e.detailAddress.toString())),
                                      DataCell(Text(e.provinceCode.toString())),
                                      DataCell(Text(e.cityCode.toString())),
                                      DataCell(Text(e.districtCode.toString())),
                                      DataCell(Text(e.villageCode.toString())),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                              onPressed: () async {},
                                              icon: const Icon(
                                                Icons.edit,
                                                color: mainColor,
                                              )),
                                          IconButton(
                                              onPressed: () async {},
                                              icon: const Icon(
                                                Icons.delete,
                                                color: mainColor,
                                              )),
                                        ],
                                      )),
                                    ]))
                                .toList())))
              ],
            ),
          ],
        ));
  }
}

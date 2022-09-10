import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/modules/Admin/DataUserAdmin/views/ubah_password_user_admin_view.dart';
import '../../../../data/models/roles.dart';
import 'package:usahaku/app/data/controller/user_controller.dart';
import 'package:usahaku/app/modules/Admin/DataUserAdmin/views/add_data_user_admin_view.dart';
import 'package:usahaku/app/modules/Admin/DataUserAdmin/views/edit_data_user_admin_view.dart';

import '../../../../shared/shared.dart';
import '../controllers/data_user_admin_controller.dart';

class DataUserAdminView extends GetView<DataUserAdminController> {
  var userController = Get.find<UserController>();
  var adminController = Get.find<DataUserAdminController>();
  // var rolesController = Get.find<RolesController>();

  DataUserAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        onRefresh: () async {
          await userController.getUser();
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
          onPressed: () {
            Get.bottomSheet(AddDataUserAdminView());
            // showCupertinoModalPopup(
            //     context: context,
            //     builder: (context) => const AddDataUserAdminView());
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
                              DataColumn(label: Text("Email")),
                              DataColumn(label: Text("Jenis Kelamin")),
                              DataColumn(label: Text("Birthday")),
                              DataColumn(label: Text("Roles")),
                              DataColumn(label: Text("Status Pengguna")),
                              DataColumn(label: Text("action")),
                            ],
                            rows: userController.dataUser.value
                                .map((e) => DataRow(cells: [
                                      DataCell(Text(
                                          "${controller.count.value = controller.count.value + 1}")),
                                      DataCell(Text(e.name.toString())),
                                      DataCell(Text(e.email.toString())),
                                      DataCell(Text(e.jenisKelamin.toString())),
                                      DataCell(Text(e.birthday.toString())),
                                      DataCell(Text(e.rolesId.toString())),
                                      DataCell(
                                          Text(e.statusPengguna.toString())),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                Get.bottomSheet(
                                                    EditDataUserAdminView());
                                                // await rolesController.getRoles();
                                                adminController.nameController
                                                    .text = e.name.toString();
                                                adminController.emailController
                                                    .text = e.email.toString();
                                                adminController.selectedGender
                                                    .value = e.jenisKelamin;
                                                adminController
                                                    .selectedStatusUser
                                                    .value = e.statusPengguna;
                                                adminController.birthday.value =
                                                    DateTime.parse(
                                                        e.birthday.toString());
                                                Roles selectedRoles = controller
                                                    .rolesController.dataRoles
                                                    .firstWhere((element) =>
                                                        element.id ==
                                                        e.rolesId);
                                                controller
                                                    .rolesController
                                                    .selectedRoles
                                                    .value = selectedRoles;
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: mainColor,
                                              )),
                                          IconButton(
                                              onPressed: () async {
                                                Get.bottomSheet(
                                                    UbahPasswordUserAdminView(
                                                  email: e.email.toString(),
                                                ));
                                                // await rolesController.getRoles();
                                                adminController.emailController
                                                    .text = e.email.toString();
                                              },
                                              icon: const Icon(
                                                Icons.lock,
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

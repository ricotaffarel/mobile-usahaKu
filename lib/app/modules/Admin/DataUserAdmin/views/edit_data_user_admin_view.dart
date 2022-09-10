// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/data/controller/roles_controller.dart';
import 'package:usahaku/app/extensions/extensions.dart';

import '../../../../data/models/roles.dart';
import '../../../../shared/shared.dart';
import '../controllers/data_user_admin_controller.dart';

class EditDataUserAdminView extends GetView<DataUserAdminController> {
  var adminController = Get.find<DataUserAdminController>();
  var rolesController = Get.find<RolesController>();

  EditDataUserAdminView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.2,
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
                    "Edit Data User",
                    style: blueTextFontBold,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 40,
                    controller: adminController.nameController,
                    hint: 'Masukan Nama',
                    title: 'Nama',
                    prefixIcon: const Icon(Icons.person),
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z1-9 ]')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 40,
                    controller: adminController.emailController,
                    hint: 'Masukan Email',
                    title: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z@.1-9]')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(() {
                    debugPrint(
                        'Jenis Kelamin: ${adminController.selectedGender.value}');
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropDownWidget(
                        title: "Jenis Kelamin",
                        list: adminController.genders,
                        value: adminController.selectedGender.value,
                        result: (value) {
                          adminController.selectedGender.value = value;
                        },
                        hint: "Laki-laki",
                        isInit: (adminController.selectedGender.value != null)
                            ? true
                            : false,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FormCustomWidget(
                        title: 'Tanggal Lahir',
                        hint: "Pilih tanggal",
                        content: (adminController.birthday.value != null)
                            ? adminController.birthday.value!.dateAndTimeLahir
                            : null,
                        icon: const Icon(
                          Icons.date_range,
                          color: greyColor,
                        ),
                        onTap: () {
                          selectedDate(
                            context,
                            onComfirm: (date) {
                              adminController.birthday.value = date;
                            },
                            currentTIme: adminController.birthday.value,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(() => Column(
                          children: [
                            DropDownWidget(
                              title: "Akes User",
                              value: rolesController.selectedRoles.value?.name,
                              list: rolesController.dataRoles
                                  .map((element) => element.name!)
                                  .toList(),
                              result: (value) {
                                adminController.selectedStatusUser.value =
                                    value;
                              },
                              hint: "Pilih Akses User",
                              isInit:
                                  (adminController.selectedStatusUser.value !=
                                          null)
                                      ? true
                                      : false,
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
                              title: "Status User",
                              value: adminController.selectedStatusUser.value,
                              list: adminController.statusUser,
                              result: (value) {
                                adminController.selectedStatusUser.value =
                                    value;
                              },
                              hint: "Pilih Akses User",
                              isInit:
                                  (adminController.selectedStatusUser.value !=
                                          null)
                                      ? true
                                      : false,
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonWidget(
                      width: Get.width - 40,
                      title: "Edit User",
                      onTap: () async {
                        await adminController.updateDataUser();
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

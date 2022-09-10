import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/data/controller/roles_controller.dart';
import 'package:usahaku/app/data/models/roles.dart';
import 'package:usahaku/app/extensions/extensions.dart';

import '../../../../shared/shared.dart';
import '../controllers/data_user_admin_controller.dart';

class AddDataUserAdminView extends GetView<DataUserAdminController> {
  var adminController = Get.find<DataUserAdminController>();
  var rolesController = Get.find<RolesController>();
  AddDataUserAdminView({Key? key}) : super(key: key);
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
                    "Tambah Data User",
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
                  FieldCustomWidget(
                    width: Get.width - 40,
                    onChange: (password) {
                      controller.onChangePassword(password);
                    },
                    controller: adminController.passwordController,
                    hint: 'Masukan Password',
                    title: 'Password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.password),
                    inputFormater: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Row(
                      children: [
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  adminController.isPasswordEigthCharacter.value
                                      ? Colors.green
                                      : Colors.transparent,
                              border:
                                  adminController.isPasswordEigthCharacter.value
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Password minimal 8 character')
                      ],
                    ),
                  ),
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
                                Roles selectedRoles = rolesController.dataRoles
                                    .firstWhere(
                                        (element) => element.name == value);
                                rolesController.selectedRoles.value =
                                    selectedRoles;
                              },
                              hint: "Pilih Akses User",
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonWidget(
                      width: Get.width - 40,
                      title: "Add User",
                      onTap: () async {
                        await adminController.createUser();
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

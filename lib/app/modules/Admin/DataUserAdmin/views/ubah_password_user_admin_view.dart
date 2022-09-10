// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import '../../../../shared/shared.dart';
import '../controllers/data_user_admin_controller.dart';

class UbahPasswordUserAdminView extends GetView<DataUserAdminController> {
  var adminController = Get.find<DataUserAdminController>();
  String? email;

  UbahPasswordUserAdminView({
    Key? key,
    required this.email,
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
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Edit Password User",
                  style: blueTextFontBold,
                ),
                FieldCustomWidget(
                  width: Get.width - 40,
                  controller: adminController.emailController,
                  hint: 'Masukan Email',
                  title: 'Email',
                  prefixIcon: const Icon(Icons.person),
                  inputFormater: [
                    FilteringTextInputFormatter.allow(RegExp('[a-z1-9@]')),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                FieldCustomWidget(
                  width: Get.width - 40,
                  onChange: (password) {
                    adminController.onChangePassword(password);
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
                CustomButtonWidget(
                    width: Get.width - 40,
                    title: "Ubah Password",
                    onTap: () async {
                      await adminController.updateDataPwUser();
                      adminController.count.value = 0;
                    }),
                const SizedBox(
                  height: 30,
                ),
              ]),
              const SizedBox(
                height: 15,
              ),
            ],
          ))
        ],
      ),
    );
  }
}

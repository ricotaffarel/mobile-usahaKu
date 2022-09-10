import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/extensions/extensions.dart';

import '../../../Widgets/widgets.dart';
import '../../../shared/shared.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        //customAppBar: Text,
        backgroundColorAppBar: color,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 20,
                          )),
                      Text(
                        'Create your Account',
                        style: blackTextFontSuperBigBold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: FieldCustomWidget(
                    controller: controller.nameController,
                    hint: 'Masukan Nama',
                    title: 'Nama',
                    prefixIcon: const Icon(Icons.person),
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z1-9 ]')),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: FieldCustomWidget(
                    controller: controller.emailController,
                    hint: 'Masukan Email',
                    title: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z@.1-9]')),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: FieldCustomWidget(
                    onChange: (password) {
                      controller.onChangePassword(password);
                    },
                    controller: controller.passwordController,
                    hint: 'Masukan Password',
                    title: 'Password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.password),
                    inputFormater: [
                      FilteringTextInputFormatter.deny(RegExp(' ')),
                    ],
                  ),
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
                            color: controller.isPasswordEigthCharacter.value
                                ? Colors.green
                                : Colors.transparent,
                            border: controller.isPasswordEigthCharacter.value
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
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: FormCustomWidget(
                      title: 'Tanggal Lahir',
                      hint: "Pilih tanggal",
                      content: (controller.birthday.value != null)
                          ? controller.birthday.value!.dateAndTimeLahir
                          : null,
                      icon: const Icon(
                        Icons.date_range,
                        color: greyColor,
                      ),
                      onTap: () {
                        selectedDate(
                          context,
                          onComfirm: (date) {
                            controller.birthday.value = date;
                          },
                          currentTIme: controller.birthday.value,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: CustomButtonWidget(
                      title: 'Register',
                      onTap: () {
                        controller.register();
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ));
  }
}

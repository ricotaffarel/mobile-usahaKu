import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/data/providers/sesionManajer.dart';
import 'package:usahaku/app/extensions/extensions.dart';
import 'package:usahaku/app/routes/app_pages.dart';
import 'package:usahaku/app/shared/shared.dart';
import '../../../../data/controller/user_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      backgroundColor: color,
        drawer: NavigationDrawerWidgetAdmin(),
        statusBarColor: const Color.fromRGBO(50, 70, 205, 1),
        customAppBar: AppBar(
          backgroundColor: const Color.fromRGBO(50, 70, 205, 1),
          title: Text(
            "Kelola Profile",
            style: whiteTextFontBig,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomButtonWidget(
            title: "Simpan",
            onTap: () async {
              controller.save();
            },
            width: Get.width - 50,
          ),
        ),
        body: Container(
          color: color,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: greyColor2,
                    child: Icon(Icons.person, size: 60),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        controller.updatePhotoProfile(context);
                      },
                      child: Text(
                        "Ubah Foto Profile",
                        style: blueTextFontTitleBold,
                      )),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: const BoxDecoration(color: accentColor1),
                    child: Text(
                      'Semua Data Harus Diisi',
                      style: blackTextFontTitleBold,
                    ),
                  ),
                  FieldCustomWidget(
                    width: Get.width - 50,
                    title: "Nama Lengkap",
                    hint: 'Masukan Nama Lengkap',
                    controller: controller.nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    debugPrint(
                        'Jenis Kelamin: ${controller.selectedGender.value}');
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DropDownWidget(
                        title: "Jenis Kelamin",
                        list: controller.genders,
                        value: controller.selectedGender.value,
                        result: (value) {
                          controller.selectedGender.value = value;
                        },
                        hint: "Laki-laki",
                        isInit: (controller.selectedGender.value != null)
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
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    height: 15,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 50,
                    title: "Email",
                    hint: 'Masukan Email',
                    controller: controller.emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FieldCustomWidget(
                    width: Get.width - 50,
                    obscureText: true,
                    title: "Password",
                    hint: 'Masukan Password',
                    controller: controller.passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

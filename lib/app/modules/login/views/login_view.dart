import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/routes/app_pages.dart';
import 'package:usahaku/app/shared/shared.dart';

import '../../../data/providers/sesionManajer.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Login your Account',
                    style: blackTextFontSuperBigBold,
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: FieldCustomWidget(
                    controller: controller.emailController,
                    hint: 'Masukan Email',
                    title: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    inputFormater: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z.@]')),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: FieldCustomWidget(
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
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: CustomButtonWidget(
                      title: 'Login',
                      onTap: () {
                        controller.login();
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  'Or',
                  style: blackTextFontBig,
                )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: CustomButtonWidget(
                      title: 'Register',
                      primaryColor: Colors.black,
                      onTap: () {
                        debugPrint(session.token);
                        Get.toNamed(Routes.REGISTER);
                        // debugPrint(controller.emailController.text);
                        // debugPrint(controller.passwordController.text);
                      }),
                ),
              ],
            ),
          ],
        ));
  }
}

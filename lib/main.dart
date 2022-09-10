// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/data/controller/user_controller.dart';
import 'package:usahaku/app/shared/shared.dart';
import 'app/data/providers/sesionManajer.dart';
import 'app/routes/app_pages.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        color: color,
        // initialBinding: BindingsBuilder<LoginController>.put(
        //   () => LoginController(),
        //   permanent: true,
        // ),
        title: "Application",
        //initialRoute: AppPages.INITIAL,
       home: Launcher(),
        getPages: AppPages.routes,
        builder: (context, widget) {
          widget = EasyLoading.init()(context, widget);
          return widget;
        });
  }
}

class Launcher extends StatefulWidget {
  Launcher({Key? key}) : super(key: key);
  var userController = Get.put(UserController());

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  Future<void> cekSession() async {
    return Future.delayed(const Duration(seconds: 3), () {
      session.getSessions().then((value) {
        if (value != null) {
          widget.userController.getMe();
        } else {
          Get.offAllNamed(Routes.ON_BOARDING);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    cekSession();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      statusBarColor: whiteColor,
      body: Center(
        child: SizedBox(
            width: Get.width - 100, child: Image.asset('assets/logo.png')),
      ),
    );
  }
}

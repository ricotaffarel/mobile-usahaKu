import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:usahaku/app/Widgets/widgets.dart';
import 'package:usahaku/app/routes/app_pages.dart';
import 'package:usahaku/app/shared/shared.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      //backgroundColorAppBar: Colors.black,
      body: PageView(
        controller: controller.controller,
        children: [
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, right: 100),
                  child: Text(
                    "Welcome to BPM YUK !",
                    style: blackTextFontSuperBigBold,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Image.asset(
                    'assets/store.png',
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Text('Kenapa Harus Belanja di BPM YUK ?',
                        style: blackTextFontBigBold,
                        textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    'Karena BPM menyediakan banyak sekali produk-produk pilihan',
                    style: blackTextFontTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, right: 100),
                  child: Text(
                    "Welcome to BPM YUK !",
                    style: blackTextFontSuperBigBold,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Image.asset(
                    'assets/payment.png',
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Text('Kenapa Harus Belanja di BPM YUK ?',
                        style: blackTextFontBigBold,
                        textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    'Karena BPM menyediakan fitur pembayaran secara otomatis tanpa perlu repot-repot mengirimkan struk pembayaran',
                    style: blackTextFontTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, right: 100),
                  child: Text(
                    "Welcome to BPM YUK !",
                    style: blackTextFontSuperBigBold,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Image.asset(
                    'assets/delivery.png',
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Center(
                    child: Text('Kenapa Harus Belanja di BPM YUK ?',
                        style: blackTextFontBigBold,
                        textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    'Karena BPM menyediakan fitur pembayaran secara delivery',
                    style: blackTextFontTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButtonWidget(
                      title: "Mulai",
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN);
                      }),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              onPressed: () async {
                Future.delayed(const Duration(microseconds: 800), () {
                  controller.controller.jumpToPage(2);
                });
              },
              child: const Text("SKIP",
                  style: TextStyle(
                    fontSize: 12,
                  ))),
          Center(
              child: SmoothPageIndicator(
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                width: 15,
                height: 15,
                color: Colors.indigo,
                rotationAngle: 135,
                verticalOffset: -10,
                borderRadius: BorderRadius.circular(2),
                // borderRadius: BorderRadius.circular(24),
                dotBorder: const DotBorder(
                  padding: 2,
                  width: 2,
                  color: Colors.indigo,
                ),
              ),
              dotDecoration: DotDecoration(
                width: 15,
                height: 15,
                rotationAngle: 45,
                color: Colors.grey,
                // dotBorder: DotBorder(
                //   padding: 2,
                //   width: 2,
                //   color: Colors.grey,
                // ),
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(2),
                //     topRight: Radius.circular(16),
                //     bottomLeft: Radius.circular(16),
                //     bottomRight: Radius.circular(2)),
                borderRadius: BorderRadius.circular(1),
                verticalOffset: 0,
              ),
              spacing: 10.0,
              // activeColorOverride: (i) => colors[i],
              inActiveColorOverride: (i) => colors[i],
            ),
            controller: controller.controller,
            count: 3,
          )),
          TextButton(
              onPressed: () {
                controller.controller.nextPage(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500));
              },
              child: const Text(
                "NEXT",
                style: TextStyle(
                  fontSize: 12,
                ),
              ))
        ]),
      ),
    );
  }
}

final colors = const [
  Colors.red,
  Colors.green,
  Colors.amber,
  // Colors.amberAccent,
  // Colors.blue,
];

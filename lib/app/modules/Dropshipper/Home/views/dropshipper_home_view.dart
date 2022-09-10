import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dropshipper_home_controller.dart';

class DropshipperHomeView extends GetView<DropshipperHomeController> {
  const DropshipperHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropshipperHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DropshipperHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

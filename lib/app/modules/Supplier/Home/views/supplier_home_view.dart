import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/supplier_home_controller.dart';

class SupplierHomeView extends GetView<SupplierHomeController> {
  const SupplierHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupplierHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SupplierHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_home_controller.dart';

class CustomerHomeView extends GetView<CustomerHomeController> {
  const CustomerHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CustomerHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/data_user_admin_controller.dart';

class DataUserAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataUserAdminController>(
      () => DataUserAdminController(),
    );
  }
}

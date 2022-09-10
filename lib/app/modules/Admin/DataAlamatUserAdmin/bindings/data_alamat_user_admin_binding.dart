import 'package:get/get.dart';

import '../controllers/data_alamat_user_admin_controller.dart';

class DataAlamatUserAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataAlamatUserAdminController>(
      () => DataAlamatUserAdminController(),
    );
  }
}

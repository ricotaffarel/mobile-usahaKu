import 'package:get/get.dart';

import '../modules/Admin/DataAlamatUserAdmin/bindings/data_alamat_user_admin_binding.dart';
import '../modules/Admin/DataAlamatUserAdmin/views/data_alamat_user_admin_view.dart';
import '../modules/Admin/DataUserAdmin/bindings/data_user_admin_binding.dart';
import '../modules/Admin/DataUserAdmin/views/data_user_admin_view.dart';
import '../modules/Admin/Profile/bindings/profile_binding.dart';
import '../modules/Admin/Profile/views/profile_view.dart';
import '../modules/Customer/Home/bindings/customer_home_binding.dart';
import '../modules/Customer/Home/views/customer_home_view.dart';
import '../modules/Dropshipper/Home/bindings/dropshipper_home_binding.dart';
import '../modules/Dropshipper/Home/views/dropshipper_home_view.dart';
import '../modules/OnBoarding/bindings/on_boarding_binding.dart';
import '../modules/OnBoarding/views/on_boarding_view.dart';
import '../modules/Register/bindings/register_binding.dart';
import '../modules/Register/views/register_view.dart';
import '../modules/Supplier/Home/bindings/supplier_home_binding.dart';
import '../modules/Supplier/Home/views/supplier_home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DATA_ALAMAT_USER_ADMIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: 350.milliseconds,
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SUPPLIER_HOME,
      page: () => const SupplierHomeView(),
      binding: SupplierHomeBinding(),
    ),
    GetPage(
      name: _Paths.DROPSHIPPER_HOME,
      page: () => const DropshipperHomeView(),
      binding: DropshipperHomeBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_HOME,
      page: () => const CustomerHomeView(),
      binding: CustomerHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DATA_USER_ADMIN,
      page: () => DataUserAdminView(),
      binding: DataUserAdminBinding(),
    ),
    GetPage(
      name: _Paths.DATA_ALAMAT_USER_ADMIN,
      page: () => DataAlamatUserAdminView(),
      binding: DataAlamatUserAdminBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:usahaku/app/data/providers/services.dart';
import 'package:usahaku/app/shared/shared.dart';

import '../models/roles.dart';

class RolesController extends GetxController with StateMixin {
  var dataRoles = List<Roles>.empty().obs;
  var selectedRoles = Rxn<Roles>();

  Future<void> getRoles() async {
    var result = await RolesProvider().getRoles();

    if (result.value != null) {
      dataRoles.value = result.value;
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.error,
          message: result.message ?? "No Messege");
    }
  }
}

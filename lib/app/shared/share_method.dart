part of 'shared.dart';

enum TypeSnackbar { success, error, info }

double widthLayout(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightLayout(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void snackbarCustom(
    {required TypeSnackbar typeSnackbar,
    String? title,
    required String message}) {
  if (!Get.isSnackbarOpen) {
    Get.rawSnackbar(
      title: title,
      message: message,
      margin: const EdgeInsets.only(
        top: 10,
        left: defaultMargin,
        right: defaultMargin,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: (typeSnackbar == TypeSnackbar.error)
          ? redColor
          : ((typeSnackbar == TypeSnackbar.info) ? Colors.amber : Colors.green),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 10,
    );
  }
}

// Future showLoading({String? status}) {
//   return EasyLoading.show(
//     status: status ?? 'loading...',
//     dismissOnTap: true,
//     maskType: EasyLoadingMaskType.black,
//   );
// }

Widget loading(double sized,
    {double diameter = 40, Color? color, double? value}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: diameter,
        width: diameter,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: sized,
          backgroundColor: color ?? mainColor,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
        ),
      ),
    ],
  );
}

Future showLoading({String? status}) {
  return EasyLoading.show(
    status: status ?? 'loading...',
    dismissOnTap: true,
    maskType: EasyLoadingMaskType.black,
  );
}

Future<File?> getSingleImage(BuildContext context) async {
  final _picker = ImagePicker();
  XFile? pickedFile;

  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              Column(
                children: [
                  ListTile(
                    onTap: () async {
                      pickedFile = await _picker.pickImage(
                          maxHeight: 1200,
                          maxWidth: 630,
                          imageQuality: 60,
                          source: ImageSource.camera);
                      Get.back();
                    },
                    title: const Text('Kamera'),
                    leading: const Icon(Icons.camera),
                  ),
                  ListTile(
                    onTap: () async {
                      pickedFile = await _picker.pickImage(
                          maxHeight: 1200,
                          maxWidth: 630,
                          imageQuality: 80,
                          source: ImageSource.gallery);
                      Get.back();
                    },
                    title: const Text('Galeri'),
                    leading: const Icon(Icons.photo_album),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );

  if (pickedFile != null) {
    return File(pickedFile!.path);
  } else {
    debugPrint('No image selected');
    return null;
  }
}

void selectedDate(
  BuildContext context, {
  required Function(DateTime value) onComfirm,
  DateTime? currentTIme,
  maxTime,
  bool isMonth = false,
}) {
  if (!(isMonth)) {
    DatePicker.showDatePicker(
      context,
      // showTitleActions: true,
      minTime: DateTime(1950, 1, 1),
      maxTime: maxTime ?? DateTime(2030, 12, 30),
      onConfirm: (date) {
        onComfirm(date);
      },
      currentTime: currentTIme ?? DateTime.now(),
      locale: LocaleType.id,
    );
  } else {
    // DatePicker.showPicker(
    //   context,
    //   pickerModel: CustomMonthPicker(
    //     currentTime: currentTIme ?? DateTime.now(),
    //     minTime: DateTime(2020, 1, 1),
    //     maxTime: DateTime(2030, 1, 1),
    //     locale: LocaleType.id,
    //   ),
    //   onConfirm: (date) {
    //     onComfirm(date);
    //   },
    // );
  }
}


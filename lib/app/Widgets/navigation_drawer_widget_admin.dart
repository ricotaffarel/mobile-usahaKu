part of 'widgets.dart';

class NavigationDrawerWidgetAdmin extends StatefulWidget {
  NavigationDrawerWidgetAdmin({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidgetAdmin> createState() =>
      _NavigationDrawerWidgetAdminState();
}

class _NavigationDrawerWidgetAdminState
    extends State<NavigationDrawerWidgetAdmin> {
  final userController = Get.find<UserController>();

  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Container(
          color: const Color.fromRGBO(50, 70, 205, 1),
          child: ListView(
            padding: padding,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CircleAvatarCustom(
                    url: (userController.user.value!.photoProfile != null)
                        ? baseURL +
                            userController.user.value!.photoProfile.toString()
                        : null,
                    isPerson: true,
                    diameter: 85),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "${userController.user.value!.name}",
                  style: whiteTextFontTitleBold,
                ),
              ),
              Center(
                child: Text(
                  "${userController.user.value!.photoProfile}",
                  style: whiteTextFontTitleBold,
                ),
              ),
              BuildMenuItem(
                  text: 'Profile',
                  icon: Icons.account_circle,
                  onClick: () => selectedItem(context, 0)),
              // MenuUser(title: "Data User", icon: Icons.abc, data: MenuDataUser(),),
              BuildMenuItem(
                  text: 'Data User',
                  icon: Icons.people,
                  onClick: () => selectedItem(context, 1)),
              BuildMenuItem(
                  text: 'Data Alamat',
                  icon: Icons.location_city,
                  onClick: () => selectedItem(context, 2)),
            ],
          ),
        ),
      ),
    );
  }
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Get.offAllNamed(Routes.ADMIN_PROFILE);
      break;
    case 1:
      Get.offAllNamed(Routes.DATA_USER_ADMIN);
      break;
    case 2:
      Get.offAllNamed(Routes.DATA_ALAMAT_USER_ADMIN);
      break;
  }
}

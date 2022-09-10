// ignore_for_file: must_be_immutable

part of 'widgets.dart';

class BuildMenuItem extends StatefulWidget {
  String text;
  IconData icon;
  VoidCallback? onClick;
  BuildMenuItem(
      {Key? key, required this.text, required this.icon, this.onClick})
      : super(key: key);

  @override
  State<BuildMenuItem> createState() => _BuildMenuItemState();
}

class _BuildMenuItemState extends State<BuildMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.black,
      leading: Icon(widget.icon, color: Colors.white),
      title: Text(
        widget.text,
        style: whiteTextFont,
      ),
      onTap: widget.onClick,
    );
  }
}

class MenuUser extends StatefulWidget {
  String? title;
  IconData? icon;
  MenuDataUser data;
  MenuUser({Key? key, this.title, this.icon, required this.data})
      : super(key: key);

  @override
  State<MenuUser> createState() => _MenuUserState();
}

class _MenuUserState extends State<MenuUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: ListTile(
              leading: Icon(widget.icon, color: Colors.white),
              title: Text(
                widget.title!,
                style: whiteTextFont,
              ),
              trailing: const Icon(
                Icons.arrow_drop_down,
                color: whiteColor,
              ) ,
            ),
            customItemsHeight: 8,
            items: [
              ...widget.data.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: widget.data.buildItem(item),
                ),
              ),
              // const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
              // ...MenuItems.secondItems.map(
              //   (item) => DropdownMenuItem<MenuItem>(
              //     value: item,
              //     child: MenuItems.buildItem(item),
              //   ),
              // ),
            ],
            onChanged: (value) {
              widget.data.onChanged(context, value as MenuItem);
            },
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: 160,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: mainColor),
            dropdownElevation: 8,
            offset: const Offset(0, 8),
          ),
        ),
      ],
    );
  }
}

class MenuItem {
  final String text;

  const MenuItem({
    required this.text,
  });
}

class MenuDataUser {
  final List<MenuItem> firstItems = [data, updatePassword];
  // static const List<MenuItem> secondItems = [logout];

  static const data = MenuItem(text: 'Data');
  static const updatePassword = MenuItem(text: 'Update Password');

  Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuDataUser.data:
        Get.offAllNamed(Routes.DATA_USER_ADMIN);
        break;
      case MenuDataUser.updatePassword:
        //Do something
        break;
    }
  }
}

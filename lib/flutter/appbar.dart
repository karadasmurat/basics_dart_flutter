import 'package:basics_dart/flutter/views/settings.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.transparent,
      backgroundColor: Color(0x44000000),
      elevation: 0,
      //leading: Icon(Icons.menu),
      title: const Text("Flutter Basics"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SettingPage()),
            );
          },
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

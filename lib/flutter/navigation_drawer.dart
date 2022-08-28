import 'package:basics_dart/flutter/animation.dart';
import 'package:basics_dart/flutter/listview.dart';
import 'package:basics_dart/flutter/modal_bottom_sheet.dart';
import 'package:basics_dart/flutter/scaffold.dart';
import 'package:basics_dart/flutter/snackbar.dart';
import 'package:basics_dart/flutter/stack.dart';
import 'package:basics_dart/flutter/stepper.dart';
import 'package:basics_dart/flutter/theme.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [menuItems(context)],
        ),
      ),
    );
  }

  Widget menuItems(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Home"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ScaffoldDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text("Themes"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ThemeDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.checklist),
          title: const Text("Stepper"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => StepperDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text("Snackbar"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SnackBarDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.animation),
          title: const Text("Animation"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AnimationDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_list_bulleted),
          title: const Text("ListView"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ListViewDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_list_bulleted),
          title: const Text("Stack"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => StackDemo()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.upload),
          title: const Text("BottomSheet"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BottomSheetDemo()),
            );
          },
        )
      ],
    );
  }
}

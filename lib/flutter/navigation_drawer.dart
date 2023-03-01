import 'package:basics_dart/flutter/animation_controller.dart';
import 'package:basics_dart/flutter/constants.dart';
import 'package:basics_dart/flutter/futurebuilder.dart';
import 'package:basics_dart/flutter/listview.dart';
import 'package:basics_dart/flutter/modal_bottom_sheet.dart';
import 'package:basics_dart/flutter/scaffold.dart';
import 'package:basics_dart/flutter/sharedpreferences.dart';
import 'package:basics_dart/flutter/snackbar.dart';
import 'package:basics_dart/flutter/stack.dart';
import 'package:basics_dart/flutter/stepper.dart';
import 'package:basics_dart/flutter/theme.dart';
import 'package:basics_dart/flutter/animations.dart';
import 'package:basics_dart/flutter/views/gamestore_ui.dart';
import 'package:basics_dart/flutter/pageview.dart';
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
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // Container(
          //   padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          // ),
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue[200]!, Colors.blue[900]!]),
                //color: Colors.blue[200],
                borderRadius: kCircularBottomRadius,
                // shape: BoxShape.circle,
                // image: const DecorationImage(
                //   image: NetworkImage(
                //     "https://source.unsplash.com/random/400x400/?profile&1",
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Text(
                'Drawer Header',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
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
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text("GameStore UI"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GameStoreHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text("Shared Preferences"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SharedPrefDemo()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text("PageView Demo"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PageViewDemo()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text("Animations"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AnimationDemo()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.save),
            title: const Text("FutureBuilder"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FutureBuilderDemo()),
              );
            },
          )
        ],
      ),
    );
  }
}

import 'package:basics_dart/constants.dart';
import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class ScaffoldDemo extends StatefulWidget {
  const ScaffoldDemo({Key? key}) : super(key: key);

  @override
  State<ScaffoldDemo> createState() => _ScaffoldDemoState();
}

class _ScaffoldDemoState extends State<ScaffoldDemo> {
  int currentBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Image.network(networkImageSrc),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            currentBottomNavIndex = index;
          });
        },
        currentIndex: currentBottomNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

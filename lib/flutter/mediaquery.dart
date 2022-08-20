import 'package:flutter/material.dart';

class MediaQueryDemo extends StatefulWidget {
  const MediaQueryDemo({Key? key}) : super(key: key);

  @override
  State<MediaQueryDemo> createState() => _MediaQueryDemoState();
}

class _MediaQueryDemoState extends State<MediaQueryDemo> {
  int currentBottomNavIndex = 0;
  var screens = <Widget>[pageTwo(), pageThree()];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("MediaQuery Demo")),
      body: screens[currentBottomNavIndex],
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
            icon: Icon(Icons.window),
            label: "Size",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_indent_decrease),
            label: "SideBar",
          ),
        ],
      ),
    );
  }
}

Widget pageOne(double w, double h) {
  return Center(
    //Change the screen size and see results, Select Device> Chrome
    child: Text("Screen width, height: $w, $h"),
  );
}

Widget pageTwo() {
  return const Center(
    child: Text("Hello there, this is page 2."),
  );
}

Widget pageThree() {
  return const Center(
    child: Text("Hello there, this is page 3."),
  );
}

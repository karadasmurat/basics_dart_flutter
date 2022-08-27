import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class ThemeDemo extends StatefulWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  State<ThemeDemo> createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {
  var volume = 0;

  @override
  Widget build(BuildContext context) {
    // re-use existing Theme definitions
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Screen Width: $screenWidth"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: buildCircles(4, screenWidth),
              ),
              Text(
                "Hello",
                style:
                    // TextStyle from theme
                    textTheme.headline1,
              ),
              Text(
                "custom font - subtitle1",
                style: textTheme.subtitle1?.copyWith(fontFamily: "Silkscreen"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et aliqua. Ut enim ad ea commodo consequat.",
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Global Theme"),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  label: const Text("ElevatedButton.icon")),
              SizedBox(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(color: Colors.white, width: 3),
                      ),
                      padding: const EdgeInsets.all(2),
                      elevation: 2),
                  onPressed: () {},
                  child: const Icon(Icons.favorite),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text("OutlinedButton"),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
                child: const Text("TextButton with a style"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      --volume;
                    });
                  },
                  icon: const Icon(Icons.volume_down),
                  color: Colors.cyan,
                ),
                Text(
                  volume.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      ++volume;
                    });
                  },
                  icon: const Icon(Icons.volume_up),
                  color: Colors.cyan,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  List<Container> buildCircles(int n, double screenWidth) {
    var width = screenWidth / (1.5 * n); //there is padding etc.
    debugPrint("width: $width");
    var circles = <Container>[];
    for (var i = 0; i < n; i++) {
      circles.add(myCircleContainer("A", width));
    }

    return circles;
  }

  Container myCircleContainer(String content, double size) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        // Circle shape
        shape: BoxShape.circle,
      ),
      child: Text(
        content,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),
      ),
    );
  }
}

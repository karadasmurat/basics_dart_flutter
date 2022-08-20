import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // re-use existing Theme definitions
    final textTheme = Theme.of(context).textTheme;
    final elevatedButtonTheme = Theme.of(context).elevatedButtonTheme;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Global Theme"),
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
              TextButton(
                onPressed: () {},
                child: const Text("TextButton"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

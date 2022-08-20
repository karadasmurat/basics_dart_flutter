import 'package:flutter/material.dart';

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // re-use existing Theme definitions
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello, there",
                style: textTheme.headline3,
              ),
              Text(
                "This is a demo text - subtitle1",
                style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et aliqua. Ut enim ad ea commodo consequat.",
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Show Message"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text("OutlinedButton"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

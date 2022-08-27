import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFontIconDemo extends StatelessWidget {
  const CustomFontIconDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // re-use existing Theme definitions
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Text(
            "custom font - subtitle1",
            style: textTheme.subtitle1?.copyWith(fontFamily: "Silkscreen"),
          ),
          Card(
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    FontAwesomeIcons.airbnb,
                    color: Colors.amber,
                  ),
                ],
              ),
              title: const Text("Font Awesome Icon"),
              subtitle: const Text("Install font_awesome_flutter package."),
            ),
          ),
        ],
      ),
    );
  }
}

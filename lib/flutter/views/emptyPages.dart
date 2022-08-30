import 'package:flutter/material.dart';

class PageWithText extends StatelessWidget {
  final String text;
  final MaterialColor backgroundColor;

  const PageWithText({
    Key? key,
    this.text = "Hello, there",
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: backgroundColor),
        child: Center(child: Text(text, style: Theme.of(context).textTheme.headline1)),
      );
}

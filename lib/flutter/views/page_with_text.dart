import 'package:flutter/material.dart';

class PageWithText extends StatelessWidget {
  final String header;
  final String text;
  final MaterialColor backgroundColor;

  const PageWithText({
    Key? key,
    this.header = "Hello, there",
    this.text = "",
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(header,
                style: Theme.of(context).textTheme.headline1,
                maxLines: 4,
                overflow: TextOverflow.ellipsis),
            Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      );
}

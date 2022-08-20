import 'package:flutter/material.dart';

import 'appbar.dart';
import 'navigation_drawer.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // re-use existing Theme definitions
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Snackbar",
                style: textTheme.headline3,
              ),
              Text(
                "This is a demo text - subtitle1",
                style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  showSnackBar2(context,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae imperdiet sem. Proin mattis non libero quis consectetur.");
                },
                child: const Text("Show Message"),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    showSnackBar2(context, "Lorem ipsum dolor sit amet");
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text("ElevatedButton.icon")),
              OutlinedButton(
                onPressed: () {},
                child: const Text("OutlinedButton"),
              ),
              TextButton(onPressed: () {}, child: const Text("Text Button")),
              IconButton(
                hoverColor: Colors.blueAccent,
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SnackBar getSnackBar1(String content) {
    return SnackBar(
      content: Text(
        content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      backgroundColor: Colors.redAccent,
    );
  }

  void showSnackBar2(BuildContext context, String content, {Icon? icon}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            // if the parameter is null, use default
            icon ?? Icon(Icons.info, color: Theme.of(context).secondaryHeaderColor),
            const SizedBox(width: 10),
            Flexible(
              // wrap text with flexible, the text overflow error.
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  SnackBar getSnackBar3() {
    return SnackBar(
      content: Container(
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "Flutter default SnackBar showing.",
          style: TextStyle(color: Colors.white, fontSize: 12),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      //behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

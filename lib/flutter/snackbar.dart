import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'appbar.dart';
import 'navigation_drawer.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // re-use existing Theme definitions
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.blue[800],
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
                color: Colors.blue[100],
              ),
              Text(
                "Snackbar",
                style: textTheme.headline3?.copyWith(color: Colors.blue[100]),
              ),
              const SizedBox(height: 100),

              // button row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // Force text in the direction of mainaxisalignment (down)
                        Expanded(
                          child: Icon(
                            Icons.message,
                            size: 30,
                            color: Colors.blue[900],
                          ),
                        ),
                        Text(
                          "Show",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showSnackBar2(context,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae imperdiet sem. Proin mattis non libero quis consectetur.");
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 100),
                      primary: Colors.pink,
                      padding: const EdgeInsets.all(8),
                      // OutlinedBorder
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: const TextStyle(
                        //fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Column(
                      children: const [
                        Expanded(child: Icon(Icons.message, size: 30)),
                        Text("Show"),
                      ],
                    ),
                  ),
                ],
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

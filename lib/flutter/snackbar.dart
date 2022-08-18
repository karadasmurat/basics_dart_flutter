import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar2(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae imperdiet sem. Proin mattis non libero quis consectetur."),
            );
          },
          child: Text("Show Message"),
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

  SnackBar getSnackBar2(String content, {Icon? icon}) {
    return SnackBar(
      content: Row(
        children: [
          // if the parameter is null, use default
          icon ?? const Icon(Icons.info, color: Colors.white),
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

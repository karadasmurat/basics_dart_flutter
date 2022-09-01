import 'package:flutter/material.dart';

class ClipPathDemo extends StatefulWidget {
  const ClipPathDemo({Key? key}) : super(key: key);

  @override
  State<ClipPathDemo> createState() => _ClipPathDemoState();
}

class _ClipPathDemoState extends State<ClipPathDemo> with TickerProviderStateMixin {
  bool isActive = false;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepPurple[800],
            ),
            child: SafeArea(
              child: Text(
                "ClipPath with a CustomClipper",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//Custom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();

    // v2
    // double firstFactor = size.width / 3.3333;
    // double secondFactor = size.height / 2;
    // double thirdFactor = size.width / 4.166;
    // double fourthFactor = size.height / 1.4285;
    // path.moveTo(firstFactor, 0);
    // path.quadraticBezierTo(thirdFactor, firstFactor, 0, firstFactor);
    // path.lineTo(0, fourthFactor);
    // path.quadraticBezierTo(
    //   size.width / 3,
    //   size.height,
    //   size.width,
    //   secondFactor,
    // );
    // path.lineTo(size.width, 0);

    // v3

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

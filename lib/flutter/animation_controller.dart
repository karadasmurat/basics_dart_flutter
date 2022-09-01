import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({Key? key}) : super(key: key);

  @override
  State<AnimationControllerDemo> createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with TickerProviderStateMixin {
  bool isActive = false;
  bool isOn = false;

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });

    _animation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          // The AnimatedContainer will automatically animate between
          // the old and new values of properties when they change using the provided curve and duration.
          // Properties that are null are not animated. Its child and descendants are not animated.
          duration: const Duration(seconds: 1),
          width: double.infinity,
          height: 200,
          color: isActive ? Colors.greenAccent : Colors.blue[200],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: _animation.value,
              ),
              onPressed: () {
                setState(() {
                  isActive = !isActive;
                });

                if (isActive) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
            ),
            const Text("ColorTween on icon and AnimatedContainer"),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

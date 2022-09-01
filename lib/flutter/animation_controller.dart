import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {
  const AnimationControllerDemo({Key? key}) : super(key: key);

  @override
  State<AnimationControllerDemo> createState() => _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    //with SingleTickerProviderStateMixin {
    with
        TickerProviderStateMixin {
  bool isActive = false;
  bool isOn = false;

  bool loaded = false;

  // AnimationController derives from Animation<double>, so it can be used wherever an Animation object is needed.
  // However, the AnimationController has additional methods to control the animation.
  // By default, an AnimationController linearly produces the numbers from 0.0 to 1.0 during a given duration.
  // The presence of vsync prevents offscreen animations from consuming unnecessary resources. You can use your stateful object as the vsync by adding SingleTickerProviderStateMixin to the class definition.
  late AnimationController _animationController;
  late AnimationController _animationControllerD;

  // An Animation object sequentially generates interpolated numbers between two values over a certain duration.
  // It has state and its current value is always available in the .value member.
  // An Animation object knows nothing about rendering or build() functions.
  late Animation _animation;
  late Animation _animationD;

  // By default, the AnimationController object ranges from 0.0 to 1.0.
  // If you need a different range or a different data type, you can use a Tween to configure an animation to interpolate to a different range or data type.
  // tween = Tween<double>(begin: -200, end: 0);
  // animation's value comes from the tween
  final colorTween = ColorTween(begin: Colors.grey, end: Colors.red);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationControllerD = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // To use a Tween object, call animate() on the Tween, passing in the controller object.
    _animation = colorTween.animate(_animationController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    //animation's value comes from the tween:
    _animationD = Tween<double>(begin: 10, end: 0).animate(_animationControllerD)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
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
          alignment: Alignment.center,
          width: double.infinity,
          height: 200,
          color: isActive ? Colors.greenAccent : Colors.blue[200],
          child: Text(
              "animation.value:\n${_animation.value}\n\ncontroller.value:\n${_animationController.value}"),
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
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(16.0),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue[200],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
                "animation.value:\n${_animationD.value}\n\ncontroller.value:\n${_animationControllerD.value}"),
            LinearProgressIndicator(
              color: Colors.green,
              backgroundColor: Colors.green[100],
              value: _animationControllerD.value,
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (loaded) {
                      _animationControllerD.forward();
                    } else {
                      _animationControllerD.reverse();
                    }
                    //toggle variable
                    loaded = !loaded;
                  },
                  child: const Text("Tween.animate"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _animationControllerD.stop();
                  },
                  child: const Text("controller.stop"),
                ),
              ],
            ),
          ]),
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

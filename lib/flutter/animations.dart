import 'package:basics_dart/flutter/animation_controller.dart';
import 'package:basics_dart/flutter/clippath.dart';
import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  double opacityValue = 1.0;
  double turns = 1.0;
  double width = 50.0;
  Color color = Colors.blue;

  final Tween<double> _scaleTween = Tween(begin: 1.0, end: 2.0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: const Text("Demo"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Animated"),
              Tab(text: "Controller"),
              Tab(text: "TweenAnimationBuilder"),
            ],
          ),
        ),
        body: TabBarView(children: [
          // Tab 1
          Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // With implicit animations, you can animate a widget property by setting a target value;
                    // whenever that target value changes, the widget animates the property from the old value to the new one.
                    // In this way, implicit animations trade control for convenience—they manage animation effects so that you don’t have to.
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.fastOutSlowIn,
                      width: width,
                      height: 50,
                      color: color,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            width = (width == 50) ? 100 : 50;
                            color = (color == Colors.blue) ? Colors.green : Colors.blue;
                          });
                        },
                        child: const Text("AnimatedContainer")),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // With implicit animations, you can animate a widget property by setting a target value;
                    // whenever that target value changes, the widget animates the property from the old value to the new one.
                    // In this way, implicit animations trade control for convenience—they manage animation effects so that you don’t have to.
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: opacityValue,
                      //curve: Curves.bounceIn,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            opacityValue = (opacityValue == 0) ? 1 : 0;
                          });
                        },
                        child: const Text("AnimatedOpacity")),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // With implicit animations, you can animate a widget property by setting a target value;
                    // whenever that target value changes, the widget animates the property from the old value to the new one.
                    // In this way, implicit animations trade control for convenience—they manage animation effects so that you don’t have to.
                    // Animated version of Transform.rotate
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 600),
                      turns: turns,
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            turns += 1.0 / 8.0;
                          });
                        },
                        child: const Text("AnimatedRotation")),
                  ],
                ),
              )
            ],
          ),
          //Tab 2
          const AnimationControllerDemo(),

          //Tab 3
          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Set a tween of Type, and use the same for the builder, ie, double
                TweenAnimationBuilder<double>(
                  tween: _scaleTween,
                  duration: const Duration(milliseconds: 600),
                  builder: (context, val, child) {
                    return Transform.scale(
                      scale: val,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

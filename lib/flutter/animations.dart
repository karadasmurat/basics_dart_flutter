import 'package:basics_dart/flutter/animation_controller.dart';
import 'package:basics_dart/flutter/clippath.dart';
import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  double opacityValue = 1;

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
              Tab(text: "ClipPath"),
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
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: opacityValue,
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
            ],
          ),
          //Tab 2
          const AnimationControllerDemo(),

          //Tab 3
          ClipPathDemo(),
        ]),
      ),
    );
  }
}

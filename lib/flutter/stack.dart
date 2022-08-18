import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Demo"),
      ),
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 300,
        //padding: EdgeInsets.all(10),
        //child: myStack(),
        child: clipImageWithATextOver("hello"),
      ),
    );
  }

  Widget clipImageWithACaptionBelow(String caption) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://source.unsplash.com/random/200x200/?car&sig=$caption",
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text(caption)
      ],
    );
  }

  Widget clipImageWithATextOver(String caption) {
    return Stack(
      children: [
        Image.network(
          "https://source.unsplash.com/random/200x200/?car&sig=$caption",
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Text(
          caption,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

Widget myStack() {
  return Stack(
    // beginning of the stack is back of the screen visually,
    // last widget is visible - last in first out

    alignment: Alignment.topCenter,
    clipBehavior: Clip.none, //overflow:Overflow.visible

    //fit: StackFit.loose,
    children: [
      Container(
        color: Colors.amberAccent,
        width: 330,
        height: 220,
      ),
      Container(
        color: Colors.orangeAccent,
        width: 150,
        height: 150,
      ),
      Positioned(
        bottom: -20, // overflow
        right: 10,
        child: Container(
          color: Colors.redAccent,
          width: 100,
          height: 150,
        ),
      ),
    ],
  );
}

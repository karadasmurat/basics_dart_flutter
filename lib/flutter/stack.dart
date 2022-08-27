import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  // DropdownButton items
  final items = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.center,
    Alignment.bottomRight
  ];
  Alignment? _alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Demo"),
      ),
      body: Column(
        children: [
          imageWithAnIconOver(
            const Icon(Icons.favorite),
            alignment: _alignment,
          ),
          myStack(alignment: _alignment),
          DropdownButton<Alignment>(
            value: _alignment, //dropdownbutton of Alignment values are Alignment.
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
                .toList(),
            onChanged: (e) {
              setState(() {
                _alignment = e;
              });
            },
          )
        ],
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

  Widget imageWithATextOver(String caption) {
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

Widget imageWithAnIconOver(Icon icon, {AlignmentGeometry? alignment}) {
  return Stack(
    alignment: alignment ?? Alignment.center,
    children: [
      Image.network(
        "https://source.unsplash.com/random/200x200/?car&sig=${icon.semanticLabel}",
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
      icon,
    ],
  );
}

Widget myStack({AlignmentGeometry? alignment}) {
  return Stack(
    // beginning of the stack is back of the screen visually,
    // last widget is visible - last in first out

    alignment: alignment ?? Alignment.center,
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

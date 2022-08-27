import 'package:basics_dart/flutter/appbar.dart';
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

  var _colorblend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  imageWithATextOver("MK"),
                  const SizedBox(width: 10),
                  imageWithAnIconOver(
                    const Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                    alignment: _alignment,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            getSimpleStack(alignment: _alignment),
            const SizedBox(height: 10),
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
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('Activate BlendMode.color'),
              value: _colorblend,
              onChanged: (bool value) {
                setState(() {
                  _colorblend = value;
                });
              },
              secondary: const Icon(Icons.lightbulb_outline),
            )
          ],
        ),
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
        const SizedBox(height: 10),
        Text(caption)
      ],
    );
  }

  Widget imageWithATextOver(String caption) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://source.unsplash.com/random/300x300/?car&sig=$caption",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            color: _colorblend ? Colors.purple : null,
            colorBlendMode: _colorblend ? BlendMode.color : null,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Text(
            caption,
            style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget imageWithAnIconOver(Icon icon, {AlignmentGeometry? alignment}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://source.unsplash.com/random/200x200/?car&sig=${icon.semanticLabel}",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            color: Colors.red,
            colorBlendMode: BlendMode.color,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: icon,
        ),
      ],
    );
  }

  Widget getSimpleStack({AlignmentGeometry? alignment}) {
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
}

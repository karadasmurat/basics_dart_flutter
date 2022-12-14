import 'package:basics_dart/flutter/appbar.dart';
import 'package:basics_dart/flutter/widgets/circled_icon.dart';
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
      backgroundColor: Colors.grey[100],
      appBar: const MyAppBar(),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // put listview in a sizedbox
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  imageWithATextOver("MK"),
                  const SizedBox(width: 10),
                  imageWithARoundedIconOver(
                    Icons.favorite,
                    alignment: _alignment,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            getSimpleStack(alignment: _alignment),
            const SizedBox(height: 10),
            //DropdownButtonFormField instead of DropdownButton
            DropdownButtonFormField<Alignment>(
              decoration: const InputDecoration(
                labelText: "Alignment",
                prefixIcon: Icon(Icons.open_with),
                //icon: Icon(Icons.send),
                border: OutlineInputBorder(),
              ),
              dropdownColor: Colors.blue[100],

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
            Card(
              child: SwitchListTile(
                title: const Text('Activate BlendMode.color'),
                value: _colorblend,
                onChanged: (bool value) {
                  setState(() {
                    _colorblend = value;
                  });
                },
                secondary: const Icon(Icons.lightbulb_outline),
              ),
            ),
            const SizedBox(height: 50),
            overflowingImage("assets/images/imgbin_giraffe.png"),
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
            width: 120,
            height: 120,
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
            width: 120,
            height: 120,
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
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://source.unsplash.com/random/200x200/?car&sig=${icon.semanticLabel}",
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            color: Colors.red,
            colorBlendMode: BlendMode.color,
          ),
        ),
        Positioned(
          bottom: -5,
          right: 10,
          child: icon,
        ),
      ],
    );
  }

  Widget imageWithARoundedIconOver(IconData iconData, {AlignmentGeometry? alignment}) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "https://source.unsplash.com/random/200x200/?car&sig=${iconData.hashCode}",
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: CircledIcon(iconData: Icons.add_circle),
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
          width: 220,
          height: 150,
        ),
        Container(
          color: Colors.orangeAccent,
          width: 100,
          height: 100,
        ),
        Positioned(
          bottom: -20, // overflow
          right: 10,
          child: Container(
            color: Colors.redAccent,
            width: 50,
            height: 75,
          ),
        ),
      ],
    );
  }

  Stack overflowingImage(String imgPath) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            imgPath,
            width: 180,
            height: 180,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}

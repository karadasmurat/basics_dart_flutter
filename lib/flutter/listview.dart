import 'dart:math';

import 'package:basics_dart/flutter/appbar.dart';
import 'package:basics_dart/flutter/constants.dart';
import 'package:basics_dart/flutter/navigation_drawer.dart';
import 'package:basics_dart/flutter/views/details.dart';
import 'package:flutter/material.dart';
import '../model/car.dart';
import 'views/car_view.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<Car> cars = [
    Car(2007, make: "KIA"),
    Car(2019, make: "VOLKSWAGEN"),
    Car(2007, make: "KIA"),
    Car(2019, make: "VOLKSWAGEN"),
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kBottomNavigationBarHeight),
          Padding(
            padding: kHorizontalPadding,
            child: Text("Items", style: Theme.of(context).textTheme.subtitle1),
          ),
          // row, without scroll capability
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: buildCircles(4, screenWidth),
          ),
          horizontalListView(),
          listWithNavigation(),
        ],
      ),
    );
    // var widget = createSimpleListView();
    // var widget = createSimpleListViewBuilder();
    // var widget = createListViewBuilderFromAList();
  }

  Widget createSimpleListView() {
    // ListView renders all the children
    // even if they are not visible on the screen - Performance problems.
    // Vertical viewport was given unbounded height - Wrap with a Flexible.
    return Flexible(
      child: ListView(
        children: const [
          Text("Data 1"),
          Text("Data 2"),
          Text("Data 3"),
          Text("Data 4"),
          Text("Data 5"),
        ],
      ),
    );
  }

  Widget createSimpleListViewBuilder() {
    return Flexible(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Text("Item $index");
          }),
    );
  }

  Widget createListViewBuilderFromAList() {
    return Flexible(
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.drive_eta),
              title: Text(cars[index].make),
              trailing: const Icon(Icons.more_vert),
            );
          }),
    );
  }

  Widget listWithNavigation() {
    return Flexible(
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            var car = cars[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent[100],
                backgroundImage: NetworkImage(logos[car.make] ??
                    "https://source.unsplash.com/random/200x200/?car&sig=$index"),
              ),
              title: Text(car.make),
              subtitle: Text(car.year.toString()),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    //builder: (context) => DetailsPage(car),
                    builder: (context) => CarPage(car),
                  ),
                );
              },
            );
          }),
    );
  }

  Widget createRowWithItems() {
    // overflow error on the right side
    return Row(
      children: [
        mySimpleContainer("1"),
        mySimpleContainer("2"),
        mySimpleContainer("3"),
      ],
    );
  }

  Widget horizontalListView() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return imageWithACaption(context, "Item $index");
        },
      ),
    );
  }

  Widget mySimpleContainer(String content, {Color? color}) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.amberAccent, // use default for optional parameter
        ),
        width: 150,
        height: 150,
        child: Center(
          child: Text(content),
        ),
      );
}

Widget imageWithACaption(BuildContext context, String caption) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/images/loading.gif",
          height: 100,
          fit: BoxFit.cover,
          image: "https://source.unsplash.com/random/200x200/?car&$caption",
        ),
        // Image.network(
        //   "https://source.unsplash.com/random/200x200/?car&sig=$caption",
        //   width: 150,
        //   height: 150,
        //   fit: BoxFit.cover,
        // ),
      ),
      const SizedBox(height: 10),
      Text(
        caption,
        style:
            Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
      )
    ],
  );
}

List<Container> buildCircles(int n, double screenWidth) {
  //const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  const emojis = [
    '\u2764',
    '😍',
    '🦄',
    '🐞',
    '😎',
    '🇹🇷',
    '🥳',
    '👍',
    '🧠',
    '⚽️',
    '🐶',
    '🍓',
    '⛱',
    '🖥'
  ];

  var width = screenWidth / (1.5 * n); //there is padding etc.
  //debugPrint("width: $width");
  var circles = <Container>[];
  for (var i = 0; i < n; i++) {
    var randomChar = emojis[Random().nextInt(emojis.length)];
    var randomAccent = Colors.accents[Random().nextInt(Colors.accents.length)];
    circles.add(myCircleContainer(randomChar, width, color: randomAccent));
    //circles.add(myCircleContainer('\u2764', width, color: randomAccent));
  }

  return circles;
}

Container myCircleContainer(String content, double size, {Color? color}) {
  return Container(
    width: size,
    height: size,
    margin: const EdgeInsets.all(5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color ?? Colors.blueAccent,
      // Circle shape
      shape: BoxShape.circle,
    ),
    child: Text(
      content,
      style: const TextStyle(fontSize: 30),
    ),
  );
}

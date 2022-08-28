import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({Key? key}) : super(key: key);

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      //appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // header row
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.blue[100],
                    ),
                  ),
                  // instead of row.mainaxisalignment: icon text ..... icon
                  Expanded(
                    child: Text(
                      "Hello, MK!",
                      style: TextStyle(
                          color: Colors.blue[100],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.blue[100],
                      iconSize: 30,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          // this is NOT a BoxShape, its ShapeBorder
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.0),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return getBottomSheet(context);
                          },
                        );
                      })
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Decoration"),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.blue[100],
                      child: const Text("ClipRRect"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    child: const Text("Decoration\n\nvertical"),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      color: Colors.blue[100],
                      child: const Text("ClipRRect\n BorderRadius.vertical"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container getBottomSheet(BuildContext context) {
    return Container(
      //height: 400,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        // the same as showmodal's shape, or there will be a white line difference.
        // use of a transparent canvas could be an option
        borderRadius: BorderRadius.circular(30),
      ),
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Music'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Video'),
            onTap: () => {},
          ),
          ButtonBar(
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';

class GameStoreHome extends StatefulWidget {
  GameStoreHome({Key? key}) : super(key: key);

  @override
  State<GameStoreHome> createState() => _GameStoreHomeState();
}

class _GameStoreHomeState extends State<GameStoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: Colors.blue[800],
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text("hello there"),
          ],
        ),
      ),
    );
  }
}

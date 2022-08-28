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
          children: [
            SizedBox(height: 50),
            overflowingImage("assets/images/imgbin_giraffe.png"),
          ],
        ),
      ),
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

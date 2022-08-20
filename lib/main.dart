import 'package:basics_dart/flutter/homepage.dart';
import 'package:basics_dart/flutter/mediaquery.dart';
import 'package:basics_dart/flutter/scaffold.dart';
import 'package:basics_dart/flutter/stack.dart';
import 'package:basics_dart/flutter/stepper.dart';
import 'package:basics_dart/flutter/theme.dart';
import 'package:flutter/material.dart';

import 'flutter/snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent,
          onPrimary: Colors.white,
        )),
      ),
      home: const ScaffoldDemo(),
    );
  }
}

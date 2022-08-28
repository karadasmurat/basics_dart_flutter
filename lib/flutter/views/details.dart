import 'package:basics_dart/flutter/appbar.dart';
import 'package:basics_dart/flutter/widgets/circled_icon.dart';
import 'package:flutter/material.dart';

// flutter pub add transparent_image

import '../../model/car.dart';

class DetailsPage extends StatelessWidget {
  final Car car;
  const DetailsPage(this.car, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green[800]),
      ),
      // for transparent appbar
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[200],

      // column with a stack (header) and a column (contents) as children
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //header
          Container(
            alignment: Alignment.center,
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(100),
              ),
            ),
            child: Image.asset(
              "assets/images/imgbin_car.png",
              width: 222,
            ),
          ),
          //Contents
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Car Details",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Colors.green[900]),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Car Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

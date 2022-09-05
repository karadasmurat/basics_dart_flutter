import 'package:basics_dart/flutter/appbar.dart';
import 'package:basics_dart/flutter/widgets/circled_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// flutter pub add transparent_image

import '../../model/car.dart';

class CarPage extends StatelessWidget {
  final Car car;
  const CarPage(this.car, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // column with a stack (header) and a column (contents) as children
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 3 components - background container, image and
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.chevron_left, size: 40),
                          ),
                        ),
                        CircledIcon(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -60,
                child: Image.asset(
                  "assets/images/imgbin_car.png",
                  width: 300,
                ),
              ),
            ],
          ),
          //Contents
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  car.make,
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
                const SizedBox(height: 40),
                RatingBar(
                    minRating: 1,
                    maxRating: 5,
                    initialRating: 3,
                    allowHalfRating: false,
                    itemSize: 24,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.amber),
                        half: Icon(Icons.star, color: Colors.red),
                        empty: const Icon(Icons.star, color: Colors.grey)),
                    onRatingUpdate: (val) {})
              ],
            ),
          )
        ],
      ),
    );
  }
}

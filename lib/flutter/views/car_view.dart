import 'package:flutter/material.dart';

// flutter pub add transparent_image
import 'package:transparent_image/transparent_image.dart';

import '../../model/car.dart';

class CarPage extends StatelessWidget {
  final Car car;
  const CarPage(this.car, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Car Details"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // FadeInImage.memoryNetwork(
            // placeholder: kTransparentImage,
            FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              height: 400,
              fit: BoxFit.fill,
              image: "https://source.unsplash.com/random/400x400/?car&sig=$car",
            ),
            const SizedBox(height: 20),
            Text(car.make,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}

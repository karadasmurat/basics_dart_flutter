import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/car.dart';
import '../model/photo.dart';

// Serialization (Encoding): Object to String
// jsonEncode(obj) -> String
// You must implement fromJson() and toJson() functions in your class.

// Domain Object -> jsonEncode(obj) -> String -> jsonDecode(str) -> Json Object (Map) -> obj.fromJson() -> Domain Object

// A map representing Car object
Map<String, dynamic> carAsAMap = {"year": 2015, "make": "VOLKSWAGEN", "model": "PASSAT"};

String API_GET_PHOTO = 'https://jsonplaceholder.typicode.com/photos/1';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  var myCar = Car(2015, make: "VOLKSWAGEN");
  // Serialization (Encoding): Object to String
  print(jsonEncode(myCar)); // {"make":"VOLKSWAGEN","model":null,"year":2015}

  List<Car> allCars = await createCarsFromJsonFile();
  // print("Here are all my cars:");
  // for (var car in allCars) {
  //   print(car);
  // }

  final responseBody = await fetchURL(API_GET_PHOTO);
  //print(responseBody);

  // Deserialization (Decoding) : String to Object (Map)
  var jsonObject = jsonDecode(responseBody);

  // Model object, from Json Object (Map)
  final photo = Photo.fromJson(jsonObject);
  print(photo);

  //JSON String representation of an object (.toJson() method should be present on the object)
  var stringFormat = jsonEncode(photo);
  //print(stringFormat);

  //get a list of objects, as a String representation
  final response_JsonArray = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //print(response_JsonArray.body);

  // List of Maps
  List<dynamic> dataList = jsonDecode(response_JsonArray.body);
  Iterable<Photo> photos = dataList.map((e) => Photo.fromJson(e));
  //print(photos.toList());
}

Future<String> loadAsset(String aFile) async {
  return await rootBundle.loadString(aFile);
}

Future<String> fetchURL(String aURL) async {
  final response = await http.get(Uri.parse(aURL));
  return Future.value(response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Car>> createCarsFromJsonFile() async {
  List<Car> cars = [];

  String carsFromJsonFile = await loadAsset("assets/json/cars.json");
  //print(carsFromJsonFile);
  var encodedObj = jsonDecode(carsFromJsonFile);

  if (encodedObj is List) {
    for (var carMap in encodedObj) {
      //print(carMap);
      cars.add(Car.fromJson(carMap));
    }
  } else {
    cars.add(Car.fromJson(encodedObj));
  }

  return Future.value(cars);
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/car.dart';
import '../model/photo.dart';

// Serialization (Encoding): Object to String
// jsonEncode(obj) -> String
// You must implement fromJson() and toJson() functions in your class.

// Domain Object -> jsonEncode(obj) -> String -> jsonDecode(str) -> Json Object (Map) -> obj.fromJson() -> Domain Object

// A map representing Car object
Map<String, dynamic> carAsAMap = {"year": 2015, "make": "VOLKSWAGEN", "model": "PASSAT"};

void main(List<String> args) async {
  // Serialization (Encoding): Object to String
  // var myCar = Car(2015, make: "VOLKSWAGEN");
  //print(jsonEncode(myCar)); // {"make":"VOLKSWAGEN","model":null,"year":2015}

  List<Car> allCars = createCars();
  print("Here are all my cars from Json String:");
  for (var car in allCars) {
    print(car);
  }

  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1'));
  //print(response.body);

  // Json String to Json Object (Map)
  var jsonObject = jsonDecode(response.body);

  // Model object, from Json Object (Map)
  final photo = Photo.fromJson(jsonObject);

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

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parsePhotos(response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

List<Car> createCars() {
  // A list of Maps representing Cars
  String carsJson = '''[
    {"year": 2015, "make": "VOLKSWAGEN", "model": "JETTA"},
    {"year": 2020, "make": "VOLKSWAGEN", "model": "PASSAT"},
    {"year": 2015, "make": "VOLKSWAGEN", "model": "TIGUAN"},
    {"year": 2019, "make": "VOLKSWAGEN", "model": "T-ROC"},
    {"year": 2015, "make": "VOLVO", "model": "S60"},
    {"year": 2015, "make": "VOLVO", "model": "S80"},
    {"year": 2015, "make": "VOLVO", "model": "V60"},
    {"year": 2015, "make": "VOLVO", "model": "V60 CROSS COUNTRY"},
    {"year": 2015, "make": "VOLVO", "model": "XC60"},
    {"year": 2015, "make": "VOLVO", "model": "XC70"},
    {"year": 2015, "make": "YAMAHA", "model": "SR400"},
    {"year": 2007, "make": "KIA", "model": "SORENTO"},
    {"year": 2020, "make": "MAZDA", "model": "6"},
    {"year": 2016, "make": "MAZDA", "model": "CX-5"},
    {"year": 2020, "make": "VOLVO", "model": "XC90"}
  ]''';

  List<Car> cars = [];

  var carMaps = jsonDecode(carsJson);
  for (var carMap in carMaps) {
    cars.add(Car.fromJson(carMap));
  }

  return cars;
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/photo.dart';

// Domain Object -> this.toJson()   -> JsonObject (Map<String, dynamic>)
//               -> jsonEncode(obj) -> String

// Domain Object -> jsonEncode(obj) -> String -> jsonDecode(str) -> Json Object (Map) -> obj.fromJson() -> Domain Object

void main(List<String> args) async {
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

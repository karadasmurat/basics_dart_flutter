import 'dart:async';

import 'package:http/http.dart' as http;

import '../model/person.dart';

final controller = StreamController<int>();
void main(List<String> args) {
  //futureBasics();
  streamBasics();
}

Future<String> getValue() async {
  await Future.delayed(const Duration(seconds: 5));
  print("Value is ready now..");
  return 'Here are the long expected results ...';
}

Future<Person> thingsCanGoWrong({bool returnWithError = false}) async {
  await Future.delayed(Duration(seconds: 3));
  print("Have been working hard, hope to return a person soon..");
  if (returnWithError) throw Exception("Ooops");

  return Future.value(Staff(name: "Foo"));
}

void futureBasics() async {
  // When you call a function that returns a future without await,
  // the function queues up work to be done and returns an uncompleted future. (instance of Future)
  var res = getValue(); // does not wait for the completion, go on.
  print(res); // Instance of 'Future<Person>'

  print("Life goes on ...");

  Person p01 = await thingsCanGoWrong(); // await keyword blocks here.
  print(p01);

  // To handle errors in an async function, use try-catch:
  try {
    Person p02 = await thingsCanGoWrong(returnWithError: true);
    print(p02);
  } catch (e) {
    print('Caught error: $e');
  }

  // Option 2: Using .then( (T value){} ).catchError( (err){} )
  // Lets call an async function, without asigning the result to a variable and await,
  // Instead, call the function and register a callback handler which handles response:
  // callback function's parameter type "T" is the return type of Future<T>
  // (http.get() returns a Future<Response> in this example.)
  http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1')).then((response) {
    print("Here is the API response:");
    print(response.body);
  }).catchError((err) {
    print("Caught Error: $err");
  });
}

Stream<String> fruitsStream() async* {
  var fruits = ["Apple", "Banana", "Strawberry", "Orange", "Mango"];
  for (var fruit in fruits) {
    yield fruit;
    await Future.delayed(Duration(seconds: 1));
  }
}

// modify stream of StreamController in an async manner.
Future<void> updateStream() async {
  for (var i = 0; i < 5; i++) {
    controller.add(i);
    //controller.sink.add(i); // does the same thing internally

    await Future.delayed(Duration(seconds: 2));

    // the error will be sent over the stream through the sink.
    controller.addError("Error! $i");
  }
  await Future.delayed(Duration(seconds: 5));

  controller.close(); // Close the stream
}

void streamBasics() {
  // Option 1: call your custom Stream function, and then .listen() to get StreamSubscription in return.
  // callback listen function's parameter type "T" is the return type of Stream<T>
  var subs = fruitsStream().where((fruit) => fruit.contains(RegExp('[e-k]'))).listen(
    (n) {
      print(n.toUpperCase());
    },
    onDone: () {
      print("thats is for fruits stream..");
    },
  );

  print("life goes on..");

  //Option2: listen to the stream controlled by a StreamController
  updateStream();
  var subs2 = controller.stream.listen((event) {
    print(event * 10);
  }, onDone: () {
    print("Numbers stream is done. Bye.");
  }, onError: (e) {
    print("Houston, we have a problem with the stream! $e");
  });
}

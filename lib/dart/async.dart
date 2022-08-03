import 'package:http/http.dart' as http;

import '../model/person.dart';

void main(List<String> args) {
  asyncBasics();
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

void asyncBasics() async {
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

  // Option 2: Using .then( (T value){} )
  // Lets call an async function, without asigning the result to a variable and await,
  // Instead, call the function and register a callback handler which handles response:
  // callback function's parameter type "T" is the return type of Future<T>
  // (http.get() returns a Future<Response> in this example.)
  http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1')).then((response) {
    print("Here is the API response:");
    print(response.body);
  });
}

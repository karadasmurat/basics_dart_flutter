import 'dart:developer' as dev;
import 'dart:math';

import '../model/car.dart';

void main(List<String> args) async {
  //variableBasics();
  //operatorBasics();
  //listBasics();
  //listFunctionsBasics();
  //comparableBasics();
  //mapBasics();
  //mapFunctionsBasics();
  //developerBasics();
  //nullSafetyBasics();
  //functionBasics();
}

void operatorBasics() {
  // Post Increment and Pre Decrement
  int x = 10; // 10  .  .
  int y = x++; // 11 10  .
  int z = --y; // 11  9  9

  print("x: $x, y: $y, z: $z"); // x: 11, y: 9, z: 9

  // Logical Operators - && || !
  // Relational Operators
  print(x > y && y == z); //true

  // 00101: 5  (Bitwise Left Shift <<1): 01010: 10
  // 10'luk sistemde 1 basamak sola kaydırınca sonuc 10 ile carpmak gibi, 2'lik sistemde 2 ile carp
  var a = 5;
  var b = 24;
  var c = a << 1; // *2 = 10
  var d = a << 2; // *4 = 20
  var e = b >> 3; // /8 = 3
  print("c: $c d: $d e: $e");

  // Assignment using Conditional Operator (?:)
  // variable = condition ? expression1 : expression2
  int base = 100;
  bool isDoubled = true;
  var res = isDoubled ? 2 * base : base;
  print(res);

  // Cascade Operator (..)
  var mk = Person("Foo");
  mk
    ..sayHi()
    ..goodBye();
}





void printContentAndHash(arg) {
  print("$arg with hashcode: ${arg.hashCode}");
}

void variableBasics() {
  // Creating a variable and initializing it.
  var notInitialized;
  print("runtimeType: ${notInitialized.runtimeType}"); // Null

  dynamic x;
  print("x is $x and runtimeType is: ${x.runtimeType}");
  x = 100;
  print("x is $x and runtimeType is: ${x.runtimeType}");
  x = "Hello World";
  print("x is $x and runtimeType is: ${x.runtimeType}");

  // The type of the name variable is inferred to be String.
  var name = 'Bob';

  // Another option is to explicitly declare the type that would be inferred:
  String Surname = 'Black';

  var multiLineStr = ''' This
  is a
  multiline
  string.''';

  print(multiLineStr);

  var a = ["x", "y"];
  printContentAndHash(a);
  var b = a;
  printContentAndHash(b);

  // with assignment, add value to a (a refers to a new object now, b refers to the old object.)
  //a = ["x", "y", "z"];

  // with mutation, add a value (mutate the object a refers to, thus b is also affacted.)
  a.add("z");

  printContentAndHash(a);
  printContentAndHash(b);

  // Uninitialized variables that have a nullable type have an initial value of null.
  int? lineCount;

  // non-nullable variables need to be assigned a value before it’s used.
  int varCount = 0;

  // late modifier, which has two use cases:
  // * Declaring a non-nullable variable that’s initialized after its declaration.
  // * Lazily initializing a variable.
  late String description;
}

void mapBasics() {
  // A Map is composed of key : value pairs inside curly braces { } (like JSON representation)
  printTitle("MAP");

  //creating an empty map, option 01
  var map01 = {};
  print(map01.runtimeType); // _InternalLinkedHashMap<dynamic, dynamic>

  //creating an empty map, option 02
  var map02 = <String, int>{};
  print(map02.runtimeType); // _InternalLinkedHashMap<String, int>

  //creating an empty map, option 03
  Map<String, int> map03 = {};

  var employee = <String, dynamic>{
    "id": 12345,
    "name": "Foo",
    "post": "Software Engineer",
  };

  print("employee : $employee");

  var myCar = {
    "make": "Volkswagen",
    "year": 2019,
  };

  print("myCar : $myCar");

  // Accessing elements - Get the value for the key (key is like the index of list)
  print(myCar["year"]);

  // Create or Set a new key:value pair
  myCar["model"] = "T-ROC";
  print("The map: $myCar has a length of ${myCar.length}");

  // Each key has exactly one value associated with it.
  var secondCar = {"model": "Volkswagen", "year": 2019, "model": "Audi"};
  print(secondCar["model"]);

  // Remove key and its associated value, if present, from the map.
  // Returns the value associated with key before it was removed. Returns null if key was not in the map.
  var mphValue = myCar.remove("mph");
  print(mphValue ?? "The key was not found in the map.");
}

void mapFunctionsBasics() {
  var employee = <String, dynamic>{
    "id": 12345,
    "name": "Foo",
    "post": "Software Engineer",
  };

  print(employee);
  print("keys: ${employee.keys}");

  // for in loop over keys
  for (var key in employee.keys) {
    print("$key : ${employee[key]}");
  }

  // for in loop over MapEntry
  for (var entry in employee.entries) {
    print("${entry.key} : ${entry.value}");
  }
}

Future<String> getNumber() {
  print("Inside getNumber method...");
  return Future.delayed(const Duration(seconds: 5), () => "*** Beklediğiniz için teşekkürler.");
}

void printTitle(String arg) {
  // Dart: Strings can be "multiplied
  String line = "-" * arg.length;
  print(line);
  print(arg);
  print(line);
}

void listBasics() {
  // In Dart, arrays are List objects, so most people just call them lists.
  // Dart list literals are denoted by a comma separated list of expressions or values, enclosed in square brackets [].

  // Creates empty list.
  var emptyList = [];
  print(emptyList.runtimeType); // List<dynamic>

  var nums = [1, 2, 3]; // type inference - Dart infers that list has type List<int>
  var strings = <String>['A', 'B'];
  var mixedList = ["one", 2, 3, "four", 5]; // List<Object>

  // Using generics, specific type only
  final List<String> growableList = ['A', 'B'];
  var secondList = <String>['X', 'X'];

  // Return a list of given length. All elements of the created list share the same [fill] value.
  var filledItems = List.filled(10, 0, growable: false);
  //filledItems.add(1); // Cannot add to a fixed-length list
  print(filledItems);

  //Accessing list elements
  print("items[0]: ${mixedList[0]}");
  print("The element at index 0 is: ${mixedList.elementAt(0)}");
  // print(items[10]); //RangeError

  // Add (Replace) data
  growableList.add('B'); // [A, B, B]
  growableList[0] = 'B'; // [B, B, B]
  // increase the length of the list by one, shifting towards the end.
  growableList.insert(1, 'M'); // [B, M, B, B]
  growableList.addAll(secondList); // [B, M, B, B, X, X]
  print(growableList);

  //remove all objeects from the list, length of the list becomes zero.
  mixedList.clear();
  print(mixedList.length);

  //Create a list and fill with a generator function for each index.
  var squares = List.generate(
    5,
    (index) => index * index,
  );
  print(squares); // [0, 1, 4, 9, 16]

  iterateList(growableList);

  // immutable (const) list
  const fruits = ["Apple", "Banana", "Strawberry"];
  // fruits.add("Melon"); // Cannot add to an unmodifiable list
  // fruits.remove("Banana"); // Cannot remove from an unmodifiable list
  // fruits = ["Orange", "Apple"]; // Constant variable, cant be assigned

// Spread operator (...)
  var list1 = [30, 40, 50];
  var list2 = [20, ...list1, 60];
  print(list2);

// collection if to create a list with three or four items in it:
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  printListInfo(nav);
}

void listFunctionsBasics() {
  // type inference - Dart infers that list has type List<String>
  var fruits = ["Mango", "Apple", "Lemon", "Orange", "Kiwi"];
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var numStrings = ["one", "two", "three", "four", "five", "six", "seven", "eight"];
  var mixedList = ["one", 2, 3, "four", 5]; // List<Object>

  // A List of Car objects
  var cars = [
    Car(2017, make: "Volkswagen"),
    Car(2015, make: "Volkswagen"),
    Car(2022, make: "Mercedes"),
    Car(2020, make: "BMW"),
    Car(2007, make: "Kia"),
  ];

  print(fruits.contains("Lemon"));

  //the first index of element in the list
  print(fruits.indexOf("Lemon"));

  // return a list with all elements that satisfy input function.
  var carsFiltered = cars.where(
    (e) => e.year > 2020,
  );
  print("Newer cars: $carsFiltered");

  print(mixedList);
  var intList = mixedList.whereType<int>();
  print("whereType<int>: $intList");

  // remove all objects satisfy the test function (returns true)
  fruits.removeWhere((element) => element.contains(RegExp(r'[A-C]')));
  print(fruits);

  // sort the list using Comparable.compare
  fruits.sort();
  print(fruits);
  // reverse order
  print(fruits.reversed);

  print(numStrings);
  // sort the list according to the order specified by the compare function
  numStrings.sort(
    (a, b) => a.length.compareTo(b.length),
  );
  print(numStrings);

  print(cars);
  // default sort
  //cars.sort(); // ERR - type Car is not a subtype of type 'Comparable

  // sort according to the property of an object
  // compareTo method of num Class: Compares this to other.
  // Returns a negative number if this is less than other, zero if they are equal, and a positive number if this is greater than other.
  // 1.compareTo(2) // -1
  cars.sort(
    (a, b) => a.year.compareTo(b.year),
  );
  print(cars);

  // map() function - maps the list to another list, using input function.
  // In other words, return a new Iterable with elements of the list modified by input function.
  var numbersDoubled = numbers.map(
    (element) => 2 * element,
  );
  print(numbers);
  // toList() creates a list containing the elements of this Iterable.
  print(numbersDoubled.toList());
}

void comparableBasics() {
  // compareTo method of num Class: Compares this to other.
  // Returns a negative number if this is less than other, zero if they are equal, and a positive number if this is greater than other.
  print("1.compareTo(2): ${1.compareTo(2)}"); // => -1
  print("2.compareTo(1): ${2.compareTo(1)}"); // => 1
  print("1.compareTo(1): ${1.compareTo(1)}"); // => 0
}

void iterateList(List arg) {
  //Option 1 - For Loop
  print("Iterating the list $arg - Option 1: For Loop");
  for (var i = 0; i < arg.length; i++) {
    print(arg[i]);
  }

  //Option 2 - For in Loop
  print("Iterating the list $arg - Option 2: For in Loop");
  for (var element in arg) {
    print(element);
  }

  //Option 3 - forEach Loop
  print("Iterating the list $arg - Option 3 - forEach Loop");
  // invoke action for each element in iteration order
  arg.forEach(
    (element) => print(element),
  );
  // short
  // arg.forEach(print);

  int cube(int arg) {
    return arg * arg * arg;
  }
}

void printListInfo(List arg) {
  print(arg);
  print("Reversed: ${arg.reversed}");
  print("Length: ${arg.length}");
  print("First element: ${arg.first} || ${arg[0]}");
  print("Last element: ${arg.last} || ${arg[arg.length - 1]}");
  print("isEmpty: ${arg.isEmpty}");
}

void developerBasics() {
  dev.log("Log message");
}

void dummyFormatForPresentation() {}

// Using null safety:
String checkListV2(List<Object>? list) {
  if (list?.isEmpty ?? false) {
    return 'Empty list';
  }
  return 'Got something';
}

String? mayReturnString() {
  String? res;
  res ??= "Hello world";
  return res;
}

void nullSafetyBasics() {
  String? mayBeNull;

  print(mayReturnString());

  // using the null-aware operator (?.) on a null value, evaluates to null.
  int? len = mayBeNull?.length;
  print("The length of the string is: $len");

  print(mayBeNull?.toString()); // null

  // When you use a null-aware operator in a method chain, if the receiver evaluates to null, then the entire rest of the method chain is short-circuited and skipped.
  print("isEven?: ${mayBeNull?.length.isEven.toString()}");

  // Assignment using ?? operator
  // Returns the left-hand side if it is not null, and the right-hand side (default) otherwise.
  var code = mayBeNull ?? "DefaultCode";
  print("null ?? 'DefaultCode' : $code"); // false

  var res = mayBeNull?.length ?? false;
  print("mayBeNull?.length ?? false: $res"); // false

  // Fallback assignment operator (??=)
  int? x;
  x = mayReturnNull();
  x ??= 0;

  print("x: $x");
}

int? mayReturnNull() {
  // return 100;
  return null;
}

int cube(int arg) {
  return arg * arg * arg;
}

void functionBasics() {
  //sayHello_positionalParam();      // ERR The analyzer produces 'not_enough_positional_arguments'
  //sayHello_positionalParam(null); // ERR The argument type 'Null' can't be assigned to the parameter type 'String'.
  sayHello_positionalParam("Masal"); // Hello, Masal!

  //sayHello_positionalParamNullable();     // The analyzer produces 'not_enough_positional_arguments'
  sayHello_positionalParamNullable(null); // Hello null!

  sayHello_namedParam(); // Hello null!
  sayHello_namedParam(name: "Masal"); // Hello Masal!

  sayHello_NamedParamDef(); //Hello Human!
  sayHello_NamedParamDef(name: "Masal"); //Hello Masal!

  //sayHello_NamedParamRequired();            // ERR missing_required_argument
  //sayHello_NamedParamRequired(name: null);  // ERR argument_type_not_assignable
  sayHello_NamedParamRequired(name: "Masal"); //Hello Masal!

  //sayHello_namedParamNullableRequired(); // ERR missing_required_argument
  sayHello_namedParamNullableRequired(name: null); // Hello null!

  sayHello_Combined("Me"); // Hello Human, this is Me.
  sayHello_Combined("myName", yourName: null); // Hello null, this is Me.
  sayHello_Combined("Me", yourName: "Stranger"); // Hello Stranger, this is Me.

  // Assign an anonymous function to a variable
  var f = (int x) => x * x * x;
  print(f.runtimeType); // (int) => int
  print(f(2)); // 8

  num Function(int, int) power = (int x, int y) => pow(x, y);
  print(power.runtimeType); // (int, int) => num
  print(power(2, 10)); // 1024
}

// A function can have any number of required positional parameters. (Cannot be missing or null)
void sayHello_positionalParam(String name) {
  print("Hello, $name!");
}

// Nullable positional parameters can be null. (Cannot be missing)
void sayHello_positionalParamNullable(String? name) {
  print("Hello $name!");
}

// Named parameters { }
// Named parameters are optional(?) unless they’re explicitly marked as 'required'.
void sayHello_namedParam({String? name}) {
  print("Hello $name!");
}

// Named parameter required and it cannot be null.
void sayHello_NamedParamRequired({required String name}) {
  print("Hello $name!");
}

// Named parameter required and it can be null.
void sayHello_namedParamNullableRequired({required String? name}) {
  print("Hello $name!");
}

// Default parameter values
// If a parameter is optional but can’t be null, provide a default value.
void sayHello_NamedParamDef({String name = "Human"}) {
  print("Hello $name!");
}

// Combination of Positional and Named Parameters, Positional First
void sayHello_Combined(String myName, {String? yourName = "Human"}) {
  print("Hello $yourName, this is $myName");
}

class Person {
  final String name;

  Person(this.name);

  void sayHi() {
    print("Hi, this is this $name");
  }

  void goodBye() {
    print("Got to go now. See you later!");
  }

  @override
  String toString() => "${super.toString()}, name: $name";
}

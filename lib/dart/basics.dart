import 'dart:developer' as dev;
import 'dart:math';

import '../model/car.dart';

void main(List<String> args) async {
  // variableBasics();
  //operatorBasics();
  //listBasics();
  //listFunctionsBasics();
  //comparableBasics();
  //mapBasics();
  //mapFunctionsBasics();
  //developerBasics();
  //nullSafetyBasics();
  functionBasics();
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
/* 
Built-in types
The Dart language has special support for the following:
  Numbers (int, double)
  Strings (String)
  Booleans (bool)
  Lists (List, also known as arrays)
  Sets (Set)
  Maps (Map)
  Runes (Runes; often replaced by the characters API)
  Symbols (Symbol)
  The value null (Null)

This support includes the ability to create objects using literals. 
For example, 'this is a string' is a string literal, and true is a boolean literal.

Because every variable in Dart refers to an object —an instance of a class— you can usually use constructors to initialize variables.

Dart apps often target multiple platforms. For example, a Flutter app might target iOS, Android, and the web. 
ie, depending on the platform, numeric types have different, hidden implementations and on the web, where Dart compiles to and interoperates with JavaScript.
On the web, the underlying int type is like a subtype of double: it’s a double-precision value without a fractional part.



 */

  // Variables constructed from literals:
  int meaningOfLife = 42;
  double valueOfPi = 3.141592;
  bool visible = true;

  // Creating a variable and initializing it.
  // Integers are numbers without a decimal point.
  var y = 1;
  var hexVal = 0xDEADBEEF;

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

  // A String is immutable and represents a sequence of characters.
  String Surname = 'Black';

  var fullname = "$Surname, $name";
  print(fullname);

  var multiLineStr = ''' This
  is a
  multiline
  string.''';

  print(multiLineStr);

  // You can create a “raw” string by prefixing it with r:
  var rawStr = r'In a raw string, not even \n gets special treatment.';
  print(rawStr);

  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // StringBuffer provides a way to construct strings efficiently.
  var moreShakespeare = StringBuffer();
  moreShakespeare.write('And all the men and women ');
  moreShakespeare.write('merely players; ...');

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // To create a compile-time constant, add "const"
  // You can’t change the value of a const variable.
  // This syntax can be used when the data type is not known:
  // const variable_name
  const aConstNum = 0;
  // aConstNum = 1; // ERR Constant variables can't be assigned a value.
  const aConstBool = true;
  const aConstString = 'a constant string';

  // If the value you have is computed at runtime (DateTime.now(), for example), you can’t use a const for it.
  // final should be used over const if you don't know the value at compile time.

  // Lists
  //In Dart, arrays are List objects, so most people just call them lists.
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

void listBasics() {
  /* 
  The dart:core library provides basic collections, such as List, Map, and Set.
  A List is an ordered collection of objects, with a length. Lists are sometimes called arrays. Use a List when you need to access objects by index.
  In Dart, arrays are List objects, so most people just call them lists.
  Dart list literals are denoted by a comma separated list of expressions or values, enclosed in square brackets [].
  */

  // Creates empty list.
  var emptyList = [];
  print(emptyList.runtimeType); // List<dynamic>

  var nums = [1, 2, 3]; // type inference - Dart infers that list has type List<int>
  var superheroes = ['Batman', 'Superman', 'Harry Potter']; //List<String> superheroes
  var strings = <String>['A', 'B'];
  var mixedList = ["one", 2, 3, "four", 5]; // List<Object>

  // Lists use zero-based indexing: 0 is the index of the first value and list.length - 1 is the index of the last value.
  // You can get a list’s length using the .length property and access a list’s values using the subscript operator []
  assert(nums.length == 3);
  assert(nums[1] == 2);

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
  growableList.add('B'); // [A, B, B] // adding element to a final list!
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
  return Future.delayed(
      const Duration(seconds: 5), () => "*** Beklediğiniz için teşekkürler.");
}

void printTitle(String arg) {
  // Dart: Strings can be "multiplied
  String line = "-" * arg.length;
  print(line);
  print(arg);
  print(line);
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

// Arrow function
// The => expr syntax is a shorthand for { return expr; }
int square(int arg) => arg * arg;

int cube(int arg) {
  return arg * arg * arg;
}

void functionBasics() {
  /* 
  
  Functions are reusable components that perform a specific task. They divide a larger program into smaller parts.
  A function is a mapping of zero or more input parameters to zero or more output parameters.
  
  The advantages of using functions are:
    - Reducing duplication of code
    - Improving clarity of the code
    - Reuse of code
    - Decomposing complex problems into simpler pieces
    - Information hiding

  Dart is a true object-oriented language, so even functions are objects and have a type, Function. 
  This means that functions can be assigned to variables or passed as arguments to other functions.
  */

  // arrow function
  print(square(5));

  /*
  Dart has two types of optional parameters: named and positional. 
  A parameter wrapped by { } is a named optional parameter. We have to use the parameter name to assign a value which separated with column.
  
    * optional parameters are optional in that the caller isn't required to specify a value for the parameter when calling the function.
    * Optional parameters can only be declared after any required parameters.
    * Optional parameters can have a default value, which is used when a caller does not specify a value.
   */

  //sayHello_positionalParam();      // ERR The analyzer produces 'not_enough_positional_arguments'
  //sayHello_positionalParam(null); // ERR The argument type 'Null' can't be assigned to the parameter type 'String'.
  sayHello_positionalParam("Masal"); // Hello, Masal!

  //sayHello_positionalParamNullable();     // The analyzer produces 'not_enough_positional_arguments'
  sayHello_positionalParamNullable(null); // Hello null!

  sayHello_NamedParam(); // Hello null!
  sayHello_NamedParam(name: null); // Hello null!
  sayHello_NamedParam(name: "Masal"); // Hello Masal!

  // sayHello_NamedParamRequired();            // ERR The named parameter 'name' is required.
  // sayHello_NamedParamRequired(name: null);  // ERR The argument type 'Null' can't be assigned to the parameter type 'String'.
  sayHello_NamedParamRequired(name: "Masal"); //Hello Masal!

  sayHello_NamedParamDefault(); //Hello Human!
  // sayHello_NamedParamDefault(name:null); // ERR The argument type 'Null' can't be assigned to the parameter type 'String'.
  sayHello_NamedParamDefault(name: "Masal"); //Hello Masal!

  //sayHello_namedParamNullableRequired(); // ERR missing_required_argument
  sayHello_namedParamNullableRequired(name: null); // Hello null!

  sayHello_Combined("Me"); // Hello Human, this is Me.
  sayHello_Combined("Me", yourName: "Stranger"); // Hello Stranger, this is Me.
  // sayHello_Combined("myName", yourName: null); // ERR String is not nullable

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
// sayHello_NamedParam(); // Hello null!
// sayHello_NamedParam(name: null); // Hello null!
// sayHello_NamedParam(name: "Masal"); // Hello Masal!
void sayHello_NamedParam({String? name}) {
  print("Hello $name!");
}

// If we have a named parameter that cannot be null:
// a. Make it optional, but provide an explicit non-null default.
// b. use required keyword.
// sayHello_NamedParamRequired();            // ERR The named parameter 'name' is required.
// sayHello_NamedParamRequired(name: null);  // ERR The argument type 'Null' can't be assigned to the parameter type 'String'.
// sayHello_NamedParamRequired(name: "Masal"); //Hello Masal!
void sayHello_NamedParamRequired({required String name}) {
  print("Hello $name!");
}

// Default parameter values: arguman gecmesen de olur, varsayilan deger kullanilir.
// If we have a named parameter that cannot be null:
// a. Make it optional, but provide an explicit non-null default.
// b. use required keyword.
// sayHello_NamedParamDefault(); //Hello Human!
// sayHello_NamedParamDefault(name:null); // ERR The argument type 'Null' can't be assigned to the parameter type 'String'.
// sayHello_NamedParamDefault(name: "Masal"); //Hello Masal!
void sayHello_NamedParamDefault({String name = "Human"}) {
  print("Hello $name!");
}

// Named parameter required and it can be null.
void sayHello_namedParamNullableRequired({required String? name}) {
  print("Hello $name!");
}

// Combination of Positional and Named Parameters, Positional First
void sayHello_Combined(String myName, {String yourName = "Human"}) {
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

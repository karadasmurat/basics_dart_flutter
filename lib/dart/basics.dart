import 'dart:developer' as dev;
import 'dart:math';
import 'dart:io';

import '../model/car.dart';

/*
enable the assert statement while executing a dart file using command prompt:
$ dart --enable-asserts basics.dart

 */
void main(List<String> args) async {
  // variableBasics();
  // conditionalBasics();
  nullSafetyBasics();
  // operatorBasics();
  // listBasics();
  // listFunctionsBasics();
  // comparableBasics();
  // setBasics();
  // mapBasics();
  // mapFunctionsBasics();
  // developerBasics();

  // functionBasics();
}

void operatorBasics() {
  // Post Increment and Pre Decrement
  // The postfix operator returns a copy of the value before it was incremented!
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

  // Use the '$' character to reference a variable
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
  // This syntax can be used when the data type is not known: const variable_name
  const daysInYear = 365;
  // daysInYear = 1; // ERR Constant variables can't be assigned a value.
  const aConstBool = true;
  const aConstString = 'a constant string';

  // The final keyword is used in situations where a value is derived at runtime (i.e. when the application is active).
  // Again the value assigned is immutable, however unlike a const value it cannot be known at compile time.
  // i.e DateTime.now(), you can’t use a const for it.
  final today = DateTime.now();
  print('Today is day ${today.weekday}');

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

String whySoSerious(int resp) {
  String status = "NA";
  if (resp < 0) {
    status = "why so negative?";
  } else if (resp == 0) {
    status = "zero? really?";
  } else {
    status = "positive vibes";
  }

  return status;
}

void conditionalBasics() {
  assert(whySoSerious(-1) == "why so negative?");
  assert(whySoSerious(0) == "zero? really?");
  assert(whySoSerious(1) == "positive vibes");
}

void listBasics() {
  /* 
  The dart:core library provides basic collections, such as List, Map, and Set.

  List<E> class represents an indexable collection of objects with a length.

  A List is an ordered collection of objects, with a length. Lists are sometimes called arrays. Use a List when you need to access objects by index.
  Dart list literals are denoted by a comma separated list of expressions or values, enclosed in square brackets [].

  The default growable list, as created by [], keeps an internal buffer, and grows that buffer when necessary. 
  This guarantees that a sequence of add operations will each execute in amortized constant time.

    var nums = [1, 2, 3];
    
    // List.filled(int length, E fill, {bool growable = false})
    var fixedLengthList = List<int>.filled(5, 0);

- There are kinds of List: 
    - fixed-length list (list’s length cannot be changed) 
    - growable list (size can be changed to accommodate new items or remove items)

- Dart List is an ordered collection which maintains the insertion order of the items.
- Dart List allows duplicates and null values.

  */

  // create a List using List() constructor or literal syntax.
  var myList = []; // empty growable list.
  printListInfo(myList); // length = 0, isEmpty = true

  // Add a value to the end of the list, extending the length by one.
  myList.add(1); // [1]
  printListInfo(myList); // length = 1, isEmpty = false

  myList.add(2); // [1, 2]
  myList.add(1); // [1, 2, 1]
  myList.add(3); // [1, 2, 1, 3]

  // Find elements / Checking the existence in List
  int q = 1;
  // Whether the collection contains an element:
  if (myList.contains(q)) {
    print("Element found: ${q} ");
  }

  // The "first" index of element in this list. Returns -1 if element is not found.
  print("The first index of ${q} is: ${myList.indexOf(q)}"); // 0

  // The "last" index of element in this list. Returns -1 if element is not found.
  print("The last index of ${q} is: ${myList.lastIndexOf(q)}"); // 2

  // Remove the first occurrence of value from this list.
  print("Removing first occurrence of 1:");
  myList.remove(1); // [2, 1, 3]
  print(myList);

  // Removes and returns the object at position index from this list. The index must be in the range 0 ≤ index < length.
  var removedElement = myList.removeAt(0); // [1, 3]
  print(myList);

  // Removes and returns the last object in this list. The list must be growable and non-empty.
  var lastElement = myList.removeLast(); // [1]
  print(myList);

  // We can create growable list by not specify the length of the List:
  // var myList = List<int>(); // var myList = [];  ERR - default List constructor isnt available when null safety is enabled.

  // Create fixed-length list
  // var myList = List(3);          // ERR - default List constructor isnt available when null safety is enabled. Use a list literal, 'List.filled' or 'List.generate'.
  // var myList = List<String>(3);  // ERR - default List constructor isnt available when null safety is enabled.

  // Create fixed-length list
  // List.filled(int length, E fill, {bool growable = false})
  var fixedLengthList = List<int>.filled(5, 0);
  // fixedLengthList.add(10); // ERR Unsupported operation: Cannot add to a fixed-length list

  // initialize List with values
  var nums = [1, 2, 3]; // type inference - Dart infers that list has type List<int>
  var superheroes = ['Batman', 'Superman', 'Harry Potter']; //List<String> superheroes
  var strings = <String>['A', 'B'];
  var mixedList = ["one", 2, 3, "four", 5]; // List<Object>

  // Lists use zero-based indexing: 0 is the index of the first value and list.length - 1 is the index of the last value.
  // You can get a list’s length using the .length property and access a list’s values using the subscript operator []
  assert(nums[1] == 2);

  // Using generics, specific type only
  final List<String> growableList = ['A', 'B'];
  var secondList = <String>['X', 'X'];

  //Access the item at specified index in a List using elementAt() method, or operator [].
  print("mixedList[0]: ${mixedList[0]}");
  print("The element at index 0 is: ${mixedList.elementAt(0)}");
  // print(items[10]); //RangeError
  // print("The element at index 10 is: ${mixedList.elementAt(10)}"); // RangeError

  // Modify the item at specified index in a List using operator [].
  growableList[0] = 'B'; // [B, B]

  // increase the length of the list by one, shifting towards the end.
  growableList.insert(1, 'M'); // [B, M, B]
  growableList.addAll(secondList); // [B, M, B, X, X]
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

  // User defined objects List
  var students = <Student>[];
  students.add(Student(name: "Ron", birthYear: 1980, gender: Gender.male));
  students.add(Student(name: "Fred", birthYear: 1978, gender: Gender.male));
  students.add(Student(name: "George", birthYear: 1978, gender: Gender.male));
  students.add(Student(name: "Ginny", birthYear: 1981, gender: Gender.female));
  print(students);

  // Combine Lists
  // v1: operator+
  var list01 = [1, 2, 3];
  var list02 = [4, 5];
  var list03 = [6, 7, 8];

  var combinedList01 = list01 + list02 + list03; // [1, 2, 3, 4, 5, 6, 7, 8]
  print(combinedList01);

  // v2: Spread operator (...)
  var combinedList02 = [...list01, ...list02, ...list03]; // [1, 2, 3, 4, 5, 6, 7, 8]
  print(combinedList02);

  var list04 = [-11, ...list01, 11]; // [-11, 1, 2, 3, 11]
  print(list04);

  //v3: // from() and addAll() method
  var combinedList03 = List.from(list01)
    ..addAll(list02)
    ..addAll(list03); // [1, 2, 3, 4, 5, 6, 7, 8]
  print(combinedList03);

  // Filter elements from a List
  var grades = [60, 68, 47, 88, 62, 44, 92];
  print("Grades: $grades");

  var passed = grades.where((e) => e > 60).toList(); //[68, 88, 62, 92]
  print("Passed (Score > 60): $passed");
  var firstScoreWhoPassed = grades.firstWhere((e) => e > 60); // 68
  print("$firstScoreWhoPassed");
  var lastScoreWhoPassed = grades.lastWhere((e) => e > 60); // 92
  print("$lastScoreWhoPassed");

  // Sort a List
  // Sorts this list according to the order specified by the compare function. The default List implementations use Comparable.compare if compare is omitted.
  grades.sort();
  print("Grades sorted: $grades");

  // int compareTo(num other): returns a negative number if this is less than other, zero if they are equal, and a positive number if this is greater than other.
  // Thus, a Comparator may compare objects as equal (return zero), even if they are distinct objects.
  // The sort function is not guaranteed to be stable, so distinct objects that compare as equal may occur in any order in the result.
  var numbers = ['one', 'two', 'three', 'four'];
  numbers.sort(); // [four, one, three, two]
  print("Default sorted: $numbers");
  numbers.sort((a, b) => a.length.compareTo(b.length));
  print("Sort using a comparator: $numbers");
  // [one, two, four, three] OR [two, one, four, three]

  students.sort(); // class Student extends Comparable and overrides compareTo()
  print("Students sorted: $students");

  // immutable (const) list
  const fruits = ["Apple", "Banana", "Strawberry"];
  // fruits.add("Melon"); // Cannot add to an unmodifiable list
  // fruits.remove("Banana"); // Cannot remove from an unmodifiable list
  // fruits = ["Orange", "Apple"]; // Constant variable, cant be assigned

// collection if to create a list with three or four items in it:
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  printListInfo(nav);
}

void printListInfo(List aList) {
  print("=== List info ===");
  print(aList);
  print("runtimeType: ${aList.runtimeType}");
  print("Number of elements in the list: ${aList.length}");
  print("isEmpty: ${aList.isEmpty}");
  if (!aList.isEmpty) {
    // aList.length > 0
    print("First element: ${aList.first} || ${aList[0]}");
    print("Last element: ${aList.last} || ${aList[aList.length - 1]}");
  }

  // print("Reversed: ${aList.reversed}");
}

void setBasics() {
  /*
  
  A collection of objects in which each object can occur only once.
  That is, for each object of the element type, the object is either considered to be in the set, or to not be in the set.

  The default Set implementation, LinkedHashSet, considers objects indistinguishable if they are equal with regard to Object.== and Object.hashCode

  */
  printTitle("Set Basics");

  // create an empty Set of integers using literal syntax
  Set<int> ratings = {};
  // Or you can move the type to the right-hand side:
  var players = <int>{};

  // create and initialize a Set of integers with values using literal syntax
  var ids = {1, 2, 3};
  print(ids);
  print('Number of elements: ${ids.length}');

  // Accessing an element by Index
  // Unlike a list, you cannot access an element at an index using square brackets [].
  // Instead, you can use the elementAt() method
  // print("The first element: ${ids[0]}"); // ERR The operator '[]' isn't defined.
  print("The first element: ${ids.elementAt(0)}");
  // we can use the first and last property to access the first and last elements respectively.
  print("The last element: ${ids.last}");

  // Adding element(s) to a set:
  ids.add(4); // {1, 2, 3, 4}
  ids.add(1); // element that already exists in a set. {1, 2, 3, 4}
  ids.addAll([1, 3, 5]); // Adds all elements to this set. {1, 2, 3, 4, 5}
  print(ids);

  // Remove value from the set:
  // Returns true if value was in the set, and false if not, has no effect if value was not in the set.
  bool isRemoved = ids.remove(3); // {1, 2, 4, 5}
  if (isRemoved) print("Value is removed from set: $ids");

  // Find elements / Checking the existence in List
  int q = 3;
  if (ids.contains(q)) {
    print("Element found in the set: ${q} ");
  }

  // the union of two sets
  var a = {1, 3, 5};
  var b = {3, 5, 7};
  var c = a.union(b); // {1, 3, 5, 7}

  // Iterating over elements of a set
  final buffer = StringBuffer();
  buffer.write("Set{");
  int i = 0;
  for (var e in c) {
    if (i++ != 0) buffer.write(", ");
    buffer.write(e);
  }
  buffer.write("}");
  print(buffer);
}

void mapBasics() {
  /*
  Map<K, V> class 
  A collection of key/value pairs, from which you retrieve a value using its associated key.

  There is a finite number of keys in the map, and each key has exactly one value associated with it.

  A Map is composed of key : value pairs inside curly braces { }  - like JSON representation of an object!

  MapEntry<K, V> class
  A key/value pair representing an entry in a Map.
   */

  printTitle("Map Basics");

  //creating an empty map, option 01
  var map01 = {}; // Map<dynamic, dynamic> map01
  print(map01.runtimeType); // _InternalLinkedHashMap<dynamic, dynamic>
  if (map01.isEmpty) print("Empty map: $map01");

  //creating an empty map, option 02
  var map02 = <String, int>{}; //Map<String, int> map02
  print(map02.runtimeType); // _InternalLinkedHashMap<String, int>

  //creating an empty map, option 03
  Map<String, int> map03 = {};

  // Initialize a Map with values:
  var employee = <String, dynamic>{
    "id": 12345,
    "name": "Foo",
    "post": "Software Engineer",
  };

  print("employee : $employee");
  print("keys: ${employee.keys}");

  var myCar = {
    "make": "Volkswagen",
    "year": 2019,
  };

  print("myCar : $myCar");

  // Accessing elements - Get the value for the key (key is like the index of list)
  print('myCar["year"]: ${myCar["year"]}');

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

  // Iterate over Map
  // a. loop over keys
  print("Iterate over keys:");
  for (var key in employee.keys) {
    print("$key : ${employee[key]}");
  }

  // b. loop over MapEntry<K, V> class represents a key/value pair representing an entry in a Map.
  print("Iterate over entries:");
  for (var entry in employee.entries) {
    print("${entry.key} : ${entry.value}");
  }

  // c. forEach() applies 'action' to each key/value pair of the map.
  print("Iterate using forEach() method:");
  employee.forEach((key, value) {
    print("key: $key, value: $value");
  });
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
  /*
   As of Dart v2.0 null type safety is now the default, meaning it is no longer possible to assign null to all data types.

   In type theory lingo, the Null type was treated as a subtype of all types. 
   Allowing null to flow into an expression of some other type means any of those operations can fail. 
   This is really the crux of null reference errors—every failure comes from trying to look up a method or property on null that it doesn’t have.
   
   Null safety eliminates that problem at the root by changing the type hierarchy. 

   When you opt into null safety, types are non-nullable by default, meaning that variables can’t contain null unless you say they can. 
   For example, if you have a variable of type String, it will always contain a string. 
   Non-nullable variables need to be assigned a value before it’s used.

      int x;
      print('x is $x.'); // Error: Non-nullable variable 'x' must be assigned before it can be used.

   In Dart, Null is also an object which means it can be used beyond the simple `no value` use case. 
   To assign a null to a data type, it is expected that the ? type is appended to the data type to explicitly indicate a value can also be null.

      int? y;
      print(“y is $y”); // “y is null"
   */

  // When you opt into null safety, types are non-nullable by default
  // String str = null; // ERR A value of type 'Null' can't be assigned to a variable of 'String'.

  printTitle("Null Safety Basics");

  String? mayBeNull;
  print("mayBeNull is $mayBeNull"); // “mayBeNull is null"

  // using the null-aware operator (?.) on a null value, evaluates to null.
  int? len = mayBeNull?.length;
  print("mayBeNull?.length: $len");
  print("mayBeNull?.toString(): ${mayBeNull?.toString()}"); // null

  // When you use a null-aware operator in a method chain, if the receiver evaluates to null, then the entire rest of the method chain is short-circuited and skipped.
  print("mayBeNull?.length.isEven.toString(): ${mayBeNull?.length.isEven.toString()}");

  // Assignment using ?? operator
  // Returns the left-hand side if it is not null, and the right-hand side (default) otherwise.
  var code = mayBeNull ?? "DefaultCode";
  print("= null ?? 'DefaultCode' : $code"); // false

  var res = mayBeNull?.length ?? false;
  print("mayBeNull?.length ?? false: $res"); // false

  print(mayReturnString());

  // Fallback assignment operator: ??= (If null, assign the value)
  int? x = returnNull();
  x ??= 0;

  print("x: $x");

  // A List of Strings, where the list itself can be null:
  List<String>? nums = ["Foo", "Bar"];
  print(nums.length);
  nums = null; // OK, the lisst itself can be null.

  // A List of Strings, whose members can be null:
  List<String?> members = ["Foo"];
  members.add(null); // OK, members can be null
  print(members);

  processNullableList(null);
}

int? returnNull() {
  return null;
}

void processNullableList(List<String>? list) {
  // print(list.length); // ERR length can't be unconditionally accessed because the receiver can be 'null'.

  // using the null-aware operator (?.) on a null value, evaluates to null.
  print("nullable argument length: ${list?.length}"); // nullable argument length: null
}

// Arrow function
// The => expr syntax is a shorthand for { return expr; }
int square(int arg) => arg * arg;

// one-liner for boolean return type
bool isEven(int x) => x % 2 == 0;

// return a conditional "expression"
String passOrFail(double score) => score >= 70.0 ? "Pass" : "Fail";

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

  // The syntax of using the assert statement: assert(condition);
  assert(square(5) == 25);
  assert(passOrFail(80.0) == "Pass");
  assert(passOrFail(1.0) == "Fail");
  assert(isEven(10) == true);
  assert(!isEven(1));

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

// Prefer using lowerCamelCase for constant names
enum Gender {
  male,
  female,
  other,
}

class Student extends Comparable {
  String name;
  int birthYear;
  Gender gender;

  Student({required this.name, required this.birthYear, required this.gender});

  int get age => DateTime.now().year - birthYear;

  @override
  String toString() =>
      '{"name": "$name", "birthYear": "$birthYear", "gender": "$gender"}';

  // sort by age (asc), then name (desc)
  @override
  int compareTo(other) {
    int ageComp = age.compareTo(other.age);
    if (ageComp == 0) {
      return -name.compareTo(other.name); // '-' for descending
    }
    return ageComp;
  }
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
  String toString() => '{"name": "$name"}';
}

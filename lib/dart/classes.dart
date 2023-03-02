/*

Refer to Point class in shape.dart for 
  - named constructor
  - redirecting constructor
  - override operator (==) of 'Object' class
  - override hashCode property of 'Object' class

Refer to Person class in student.dart for 
  - constructor with positional parameter, required named parameter and named parameter with a default value.

Refer to utils.dart for
  - Extension methods vs static utility methods


 */

import 'package:basics_dart/dart/basics.dart';
import 'package:basics_dart/model/utils.dart';

import '../model/box.dart';
import '../model/generics.dart';
import '../model/shape.dart';
import '../model/student.dart';
import '../model/animal.dart';

void main(List<String> args) {
  // Access the enumerated values like any other static variable: Gender.male
  var x = Student(name: "Mike", birthYear: 1990, gender: Gender.male);
  var y = x;

  // Variables x and y refer to the same object, therefore will have the same hashcode:
  print(x.hashCode);
  print(y.hashCode);

  var box01 = HolderWithStaticMembers("Box01");
  var box02 = HolderWithStaticMembers("Box02");

  // Class level (static) variable - shared by all instances
  box01.increment();
  box01.increment();

  print(box02.count); // 2
  print(box01.count); // 2

  // constructorBasics();
  // operatorOverloading();
  // polymorphismBasics();
  // extensionMethods();
  generics();
}

void constructorBasics() {
  // var point = Point(); // ERR positional argument(s) are expected.

  var point01 = Point(10, 20);
  print(point01);

  var point02 = Point.alongXAxis(3); // A redirecting constructor
  print(point02);

  var point03 = Point.fromJson({"x": 11, "y": 22}); // named constructor
  print(point03);
}

void operatorOverloading() {
  var point01 = Point(10, 0);
  var point02 = Point.alongXAxis(10);
  var p3 = "not a point";

  if (point01 == point02) {
    print(point01);
    print(point02);
    print("${point01.hashCode} and ${point01.hashCode} points are the same.");

    assert(p3 != point01);
  }
}

void polymorphismBasics() {
  /*
   Superclass <varname> = Subclass() 
  */
  printTitle("Polymorphism Basics");

  //instance of a concrete implementation of an interface
  Walkable crawl = CrawlingBehavior();
  Walkable onLegs = WalkOn2LegsBehavior();

  Animal animal = Monkey("Animee", onLegs);
  animal.eat();
  // animal.aMonkeyMethod(); // ERR - method aMonkeyMethod() is not defined for the type 'Animal'
  // animal.walk(); // ERR - method walk() is not defined for the type 'Animal'

  Walkable walker = Monkey("Walkie", onLegs);
  walker.walk();
  // walker.eat(); // ERR - method eat() is not defined for the type 'Walkable'

  // monkey is concrete Monkey instance.
  Monkey babyMonkey = Monkey("Monkee", crawl);
  babyMonkey.eat(); // banana
  babyMonkey.walk();

  Animal dog = Dog("Karabas", Breed.bulldog);
  dog.eat(); // default - inherited from superclass
  dog.sleep(); // bones
  // dog.bark() // ERR The method 'bark' isn't defined for the type 'Animal'
}

void extensionMethods() {
  String name = "Hagrid";

  // With the extension method in place, you can now call it on any String object directly:
  print("The first character of the name is: ${name.getFirstCharacter()}");

  // Property extension: String get last
  print("The last character of the name is: ${name.last}");
}

void generics() {
  const pair = Pair<String, int>("MSL", 8);
  print(pair);
  print("First element: ${pair.key}");
}

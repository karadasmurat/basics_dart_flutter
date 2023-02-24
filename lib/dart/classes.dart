import 'package:basics_dart/dart/basics.dart';

import '../model/box.dart';
import '../model/student.dart';
import '../model/animal.dart';

void main(List<String> args) {
  var x = Student(name: "Mike", birthYear: 1990, gender: Gender.male);
  var y = x;

  // Variables x and y refer to the same object, therefore will have the same hashcode:
  print(x.hashCode);
  print(y.hashCode);

  var box01 = Box("Box01");
  var box02 = Box("Box02");

  // Class level (static) variable - shared by all instances
  box01.increment();
  box01.increment();

  print(box02.count); // 2
  print(box01.count); // 2

  polymorphismBasics();
}

void polymorphismBasics() {
  printTitle("Polymorphism Basics");

  //instance of a concrete implementation of an interface
  Walkable crawl = CrawlingBehavior();
  Walkable onLegs = WalkOn2LegsBehavior();

  Animal animal = Monkey("Animee", onLegs);
  animal.eat();
  // animal.walk(); // ERR - method walk() is not defined for the type 'Animal'

  Walkable walker = Monkey("Walkie", onLegs);
  walker.walk();
  // walker.eat(); // ERR - method eat() is not defined for the type 'Walkable'

  // monkey is concrete Monkey instance.
  Monkey babyMonkey = Monkey("Monkee", crawl);
  babyMonkey.eat(); // banana
  babyMonkey.walk();

  Animal dog = Dog("Karabas", "Kangal");
  dog.eat(); // default - inherited from superclass
  dog.sleep(); // bones
  // dog.bark() // ERR The method 'bark' isn't defined for the type 'Animal'
}

import 'dart:math';

import 'basics.dart';

/// A simple constructor demo with syntactic sugar and initializer list.
class Point {
  int x, y;

  // When initializing fields is the single goal of the constructor, body { } is optional.

  // Constructor
  // Syntactic sugar to initialize variables. (Positional Arguments)
  Point(this.x, this.y);

  // Constructor
  // Initializer list to initialize variables. (Positional Arguments)
  Point.init(int a, int b)
      : x = a,
        y = b;

  // Constructor Body to initialize variables.
  // If instance fields are non nullable or final, this would give an ERR.
  // syntactic sugar or initializer list executes before the body, thus initialize fields, preventing this initialization ERR. late variables also OK.
  // Point.traditional(int a, int b) {
  //  x = a;
  //  y = b;
  // }

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }

  @override
  String toString() {
    return "${super.toString()}, x: $x, y: $y,  hashCode: $hashCode";
  }
}

/// A simple const constructor demo
/// Only classes with a const constructor can be instantiated using const keyword.
class Phone {
  static const initialCapacity = 16;

  // final fields, to be initialized in the "constructor" ONCE.
  // not initialized here.

  //non-nullable fields
  // 1. positional arg, (make)
  // 2. an optional with a. required annotation or default value (numOfSIM).
  final String make;
  final int numOfSIM;
  final bool? isUsed;

  // To define a const constructor, all fields of a class must be final.
  const Phone(this.make, {this.numOfSIM = 1, this.isUsed});

  @override
  String toString() =>
      "{hashcode: $hashCode, make: $make ,isUsed: $isUsed ,numOfSIM: $numOfSIM }";
}

class SimpleParent {
  SimpleParent() {
    print("Default Constructor of parent called.");
  }
}

class SimpleChild extends SimpleParent {
  // Compiler implicitly invokes the parent class’s default constructor (no-arg constructor).
  // If no parameters are defined in a superclass constructor, you can bypass the call to super() in your subclass.
  SimpleChild() {
    print("SimpleChild() constructor called.");
  }
}

class ParentWithNoDefaultConstructor {
  // Named constructor
  ParentWithNoDefaultConstructor._internal() {
    print("Named Constructor of parent called.");
  }
}

class Child extends ParentWithNoDefaultConstructor {
  // Superclass doesn't have a zero argument constructor.
  // Child must implicitly invoke a constructor of superclass.
  Child() : super._internal() {
    print("Child() constructor called");
  }
}

class Exam {
  final int score;
  int? calculatedScore;
  bool? isTop;

  // A. Default constructor, initializing instance variable with a default value.
  Exam() : score = 0 {
    print("Exam() - default constructor called.");
  }

  // B. Named constructor, named parameter with a default value.
  Exam.defaultScore({this.score = -1})
      : calculatedScore = 2 * score,
        isTop = score > 90 ? true : false;

  @override
  String toString() =>
      "{score: $score, calculatedScore: $calculatedScore, isTop: $isTop, hashCode: $hashCode}";
}

void main(List<String> args) {
  var exam01 = Exam();
  print(exam01); // {score: 0, calculatedScore: null, isTop: null}

  var exam02 = Exam.defaultScore();
  print(exam02); // score: 0

  var exam03 = Exam.defaultScore(score: 99);
  print(exam03); // score: 99

  // Default Constructor of parent called.
  // SimpleChild() constructor called.
  var child = new SimpleChild();

  var child02 = new Child();

  var point01 = Point(10, 20);
  print(point01);

  var point02 = Point.init(10, 20);
  print(point02);

  var a = Point(2, 2);
  var b = Point(4, 4);
  // Static methods (class methods) don’t operate on an instance
  var distance = Point.distanceBetween(a, b);

  printTitle("const Constructors");

  // const keyword not used
  var phone01 = Phone("IPhone");
  var phone02 = Phone("iPhone");
  // const keyword used
  var phone03 = const Phone("Samsung");
  var phone04 = const Phone("Samsung");

  print(phone01);
  print(phone02);
  //check whether 2 references are to the same object.
  print(identical(phone01, phone02)); // false

  print(phone03);
  print(phone04);
  print(identical(phone03, phone04)); // true, const canonicalizes.
}

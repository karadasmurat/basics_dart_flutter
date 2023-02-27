/*
A constructor is utilized to guarantee instances are made in a reasonable state.

1.a)  Default Constructor
      Even if you don’t declare a constructor, a default constructor is provided for you. 
      The default constructor has no arguments ( )  and invokes the no-argument constructor in the superclass.
          ClassName();

1.b)  Parameterised Constructor
      A constructor with the same ClassName:
          ClassName(this.variable1, this.variable2); //Dart provides syntactic sugar to initialize variables. 

1.c)  Named constructors
      In other languages, it is possible to overload your constructor. In Dart, this is not possible, but there is a way around it:
      Use a named constructor to implement multiple constructors for a class or to provide extra clarity:
          Classname.constructorname( ... )

Private Named Constructors:
    class Robot {

      Robot._();
    }


Initializer list (:) 
You can initialize instance variables before the constructor body runs. 
Comma separated list of expressions that can access constructor parameters and can assign to instance fields, even final instance fields. 
This is handy to initialize final fields with calculated values.
The initializer list is also used to call other constructors like : super('Foo')

 */

import 'basics.dart';
import '../model/person.dart';
import '../model/student.dart';

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

class ParentWithDefaultConstructor {
  SimpleParent() {
    print("Default Constructor of parent called.");
  }
}

class SimpleChild extends ParentWithDefaultConstructor {
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

void main(List<String> args) {
  //Person p = Person(); // ERR positional argument(s) expected.

  Person p01 = Person("Potter", firstName: "Harry");
  Person p02 = Person("Weasley", firstName: "Ron", middleName: "Bilius");
  Person p03 = Person("Granger", firstName: "Hermione", birthYear: 1979);

  print(p01); // {"fn": "Harry", "m": "null", "ln": "Potter", "by": 1900}
  print(p02); // {"fn": "Ron", "m": "Bilius", "ln": "Weasley", "by": 1900}
  print(p03); // {"fn": "Hermione", "m": "null", "ln": "Granger", "by": 1979}

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

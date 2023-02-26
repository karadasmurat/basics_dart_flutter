// Use the 'abstract' modifier to define an abstract class—a class that can’t be instantiated.
// Abstract classes are useful for defining interfaces, often with some implementation.
// Abstract classes can contain abstract methods (with empty bodies).
abstract class Animal {
  String name;

  // When initializing fields is the single goal of the constructor, body { } is optional.

  // Syntactic sugar to initialize variables. (Positional Arguments)
  // Animal(String n) : name = n;
  Animal(this.name);

  // a method with a default implementation
  void eat() {
    print("$name is eating by default.");
  }

  // abstract method, without a body.
  void sleep();
}

// Interface for walk behavior
// Dart has no interface keyword. Instead, all classes implicitly define an interface. Therefore, you can implement any class.
// If you want to create a class A that supports class B’s API without inheriting B’s implementation, class A should implement the B interface
abstract class Walkable {
  void walk();
}

// Concrete implementation of a specific walk behavior, lets code reuse.
class CrawlingBehavior implements Walkable {
  @override
  void walk() {
    print("I can crawl.");
  }
}

// Concrete implementation of a specific walk behavior, lets code reuse.
class WalkOn2LegsBehavior implements Walkable {
  @override
  void walk() {
    print("I can walk on two legs.");
  }
}

class Monkey extends Animal implements Walkable {
  Walkable walkBehavior;

  // Dependency Injection by Constructor
  Monkey(String name, this.walkBehavior) : super(name);

  // Concrete implementation delegates the task!
  @override
  void walk() {
    walkBehavior.walk();
  }

  @override
  void eat() {
    print("$name loves eating bananas.");
  }

  void aMonkeyMethod() {
    print("$name has a monkey specific behavior.");
  }

  @override
  void sleep() {
    print("$name is sleeping on the tree.");
  }
}

enum Breed {
  retriever,
  bulldog,
  poodle,
  husky,
  other,
}

class Dog extends Animal {
  Breed breed; // enum Breed

  // explicit call to super constructor
  // Dog(String name, this.breed) : super(name);
  Dog(super.name, this.breed); // syntactic sugar for calling super constructor

  void bark() {
    print("$name is barking!");
  }

  @override
  void sleep() {
    print("$name is sleeping on the bones.");
  }
}

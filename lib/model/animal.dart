abstract class Animal {
  String name;

  Animal(this.name);

  void eat() {
    print("$name is eating by default.");
  }

  void sleep();
}

// Interface for walk behavior
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

  @override
  void sleep() {
    print("$name is sleeping on the tree.");
  }
}

class Dog extends Animal {
  String breed;

  // explicit call to super constructor
  Dog(String name, this.breed) : super(name);

  void bark() {
    print("$name is barking!");
  }

  @override
  void sleep() {
    print("$name is sleeping on the bones.");
  }
}

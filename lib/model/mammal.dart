abstract class Mammal {
  void eat() {
    print("I am a mammal, and I love eating.");
  }
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

class Human extends Mammal implements Walkable {
  Walkable walkBehavior;

  // Dependency Injection by Constructor
  Human(this.walkBehavior);

  // Concrete implementation of Walkable.walk
  @override
  void walk() {
    walkBehavior.walk();
  }
}

import '../model/mammal.dart';

void main(List<String> args) {
  //instance of a concrete implementation of an interface
  Walkable crawl = CrawlingBehavior();
  Walkable onLegs = WalkOn2LegsBehavior();

  Mammal mammal = Human(onLegs);
  mammal.eat();
  // ERR - method walk() is not defined for the type Mammal
  // *** Human is "more than Mammal"
  // mammal.walk();

  Walkable walker = Human(onLegs);
  // ERR - method eat() is not defined for the type Walkable
  // *** Human is "more than Walkable"
  // walker.eat();
  walker.walk();

  // baby is concrete Human instance.
  Human baby = Human(crawl);
  baby.eat(); // implemented in superclass
  baby.walk();
}

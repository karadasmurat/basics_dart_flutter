// A simple demo for static members
class Box {
  // Class (static) variables for class-wide state and constants.
  // They are associated with the class, rather than with any object.
  // Every instance of the class shares a class variable, which is in one fixed location in memory.
  // Any object can change the value of a class variable,
  // but class variables can also be manipulated without creating an instance of the class.

  // Class level constant
  static const int LIMIT = 100;

  // Class level (static) variable - shared by all instances
  static int _count = 0;

  // Instance variable - each object each have their own distinct copies of instance variables.
  String name;

  Box(this.name);

  // modify class variable
  increment() => ++_count;

  int get count => _count;
}

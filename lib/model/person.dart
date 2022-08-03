// Use the abstract modifier to define an abstract class.
// An abstract class is one whose main purpose is to define a common interface for its subclasses.
// An abstract class will defer some or all of its implementation to operations defined in subclasses;
// hence an abstract class cannot be instantiated.
// The operations that an abstract class declares but doesn't implement are called abstract operations.

// Clients only know about the abstract class(es) defining the interface.
// Clients remain unaware of the specific types of objects they use,
// as long as the objects adhere to the interface that clients expect.

// The superclass, or parent class (sometimes called base class),
// contains all the attributes and behaviors that are common to classes that inherit from it.
abstract class Person {
  String name;

  Person({required this.name});

  // method with implementation, to be reused by subclasses.
  void sayHi() {
    print("Hi! This is $name. Well, you see, abstract classes can have method implementation!");
  }

  // abstract method, without a body.
  // Implementations must be present in the concrete subclass.
  void introduce();
}

class Staff extends Person {
  // new field definition
  String department;

  // also calling related super constructor
  Staff({required super.name, this.department = "Pool"});

  @override
  void introduce() {
    print("This is $name from $department.");
  }

  // A new, specific to Staff method definition
  void staffSpecificMethod() {
    print("This is another useful method.");
  }
}

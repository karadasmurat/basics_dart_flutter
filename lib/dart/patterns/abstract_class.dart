// Use the abstract modifier to define an abstract class—a class that can’t be instantiated.
// Abstract classes are useful for defining interfaces, often with some implementation.
abstract class Person {
  String name;

  Person({this.name = "Person"});

  // method with implementation, to be reused by subclasses.
  void sayHi() {
    print(
        "This is $name. Greetings from the abstract class method implementation!");
  }

  // abstract method, without a body.
  // Implementations must be present in the concrete subclass.
  void introduce();
}

class Student extends Person {
  // new field definition
  String department;

  // also calling related super constructor 
  Student({super.name, required this.department});

  @override
  void introduce() {
    print("This is $name from $department.");
  }

  // new method definition
  void studentSpecificMethod() {
    print("This is another useful method.");
  }
}

void main() {
  // ERR Abstract classes can't be instantiated. Create an instance of concrete subtype
  // Person p = Person();

  Person cs = Student(department: "Computer Science");
  cs.sayHi(); // implemented in abstract superclass
  cs.introduce();

  Person md = Student(name: "Burcu", department: "Medicine");
  md.sayHi();
  md.introduce();
}

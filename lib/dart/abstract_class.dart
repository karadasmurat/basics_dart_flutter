import '../model/person.dart';

void main() {
  // ERR Abstract classes can't be instantiated. Create an instance of concrete subtype
  // Person p = Person(name: 'Foo');

  Person cs = Staff("Bar", firstName: "Foo", department: "Computer Science");
  cs.sayHi(); // implemented in abstract superclass
  // cs.introduce();

  Person md = Staff("Baz", firstName: "Mike", department: "Medicine");
  md.sayHi();
  // md.introduce();
}

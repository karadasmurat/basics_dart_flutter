import '../model/person.dart';

void main() {
  // ERR Abstract classes can't be instantiated. Create an instance of concrete subtype
  // Person p = Person(name: 'Foo');

  Person cs = Staff(department: "Computer Science", name: 'Foo');
  cs.sayHi(); // implemented in abstract superclass
  cs.introduce();

  Person md = Staff(name: "Baz", department: "Medicine");
  md.sayHi();
  md.introduce();
}

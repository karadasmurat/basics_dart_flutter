// Prefer using lowerCamelCase for constant names
enum Gender {
  male,
  female,
  other,
}

class Student extends Comparable {
  String name;
  int birthYear;
  Gender gender;

  Student({required this.name, required this.birthYear, required this.gender});

  int get age => DateTime.now().year - birthYear;

  @override
  String toString() =>
      '{"name": "$name", "birthYear": "$birthYear", "gender": "$gender"}';

  // sort by age (asc), then name (desc)
  @override
  int compareTo(other) {
    int ageComp = age.compareTo(other.age);
    if (ageComp == 0) {
      return -name.compareTo(other.name); // '-' for descending
    }
    return ageComp;
  }
}

class Person {
  final String name;

  Person(this.name);

  void sayHi() {
    print("Hi, this is this $name");
  }

  void goodBye() {
    print("Got to go now. See you later!");
  }

  @override
  String toString() => '{"name": "$name"}';
}

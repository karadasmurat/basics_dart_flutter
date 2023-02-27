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
  String lastName; // non-nullable, lets make it positional
  String firstName; // non-nullable, lets make required named parameter
  String? middleName; // nullable, lets make it optional
  int birthYear; // non-nullable, lets make it optional with a default value of 1900

  Person(this.lastName,
      {required this.firstName, this.middleName, this.birthYear = 1900});

  void sayHi() {
    print("Hi, this is this $lastName, $firstName");
  }

  void goodBye() {
    print("Got to go now. See you later!");
  }

  @override
  String toString() =>
      '{"fn": "$firstName", "m": "$middleName", "ln": "$lastName", "by": $birthYear}';
}

class Exam {
  final int score;
  int? calculatedScore;
  bool? isTop;

  // A. Default constructor, initializing instance variable with a default value.
  Exam() : score = 0 {
    print("Exam() - default constructor called.");
  }

  // B. Named constructor, named parameter with a default value.
  // In other languages, it is possible to overload your constructor. In Dart, this is not possible, but there is a way around it:
  // Use a named constructor to implement multiple constructors for a class or to provide extra clarity:
  // Classname.constructorname
  Exam.defaultScore({this.score = -1})
      : calculatedScore = 2 * score,
        isTop = score > 90 ? true : false;

  @override
  String toString() =>
      "{score: $score, calculatedScore: $calculatedScore, isTop: $isTop, hashCode: $hashCode}";
}

class Student {
  final int ID;
  final String name;
  final String? major; // Declare instance variable major, initially null.

  Student(this.ID, {required this.name, this.major});

  @override
  String toString() => "{class: $Student, hashCode: $hashCode, ID: $ID, name: $name, major: $major}";
}

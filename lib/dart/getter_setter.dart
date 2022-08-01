void main(List<String> args) {
  var p = Person(1, "Behzat", "C.");

  p.code = 2;
  print(p);

  p.code = -10; // Setter: Code should be greater than zero.
  print(p); // Getter: 1

  print(p.fullName); // Getter
  print(p.getFullName()); // Method instead of getter
}

/// Demo for getters and setters
class Person {
  int _code;
  String _name;
  String _surname;

  Person(this._code, this._name, this._surname);

  // explicit getter, without ()
  // not recommended if some validation or calculation is not done
  int get code => _code;

  //getter, without a specific property
  String get fullName => "$_surname, $_name";

  // this could be a method as well
  String getFullName() => "$_surname, $_name";

  //explicit setter
  set code(int aCode) {
    if (aCode < 0) {
      print("Code should be greater than zero.");
    } else {
      _code = aCode;
    }
  }

  @override
  String toString() => "{code: $_code, name: $_name, surname: $_surname}";
}

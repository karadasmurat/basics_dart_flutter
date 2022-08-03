import '../model/box.dart';
import '../model/student.dart';

void main(List<String> args) {
  var x = Student(123, name: "Mike");
  var y = x;

  // Variables x and y refer to the same object, therefore will have the same hashcode:
  print("$x, ${x.hashCode}");
  print("$y, ${y.hashCode}");

  var box01 = Box("Box01");
  var box02 = Box("Box02");

  box01.increment();
  box01.increment();

  print(box02.count);
  print(box01.count);
}

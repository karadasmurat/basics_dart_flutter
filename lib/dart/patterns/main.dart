import 'singleton.dart';

void main() {
  basic_singleton();
}

void basic_singleton() {
  var s01 = Singleton.instance;
  var s02 = Singleton.instance;

  // ERR - the class does not have unnamed constructor.
  // var s03 = Singleton();

  //check whether two references are to the same object
  print(identical(s01, s02)); //true
  print(s01.hashCode == s02.hashCode); //true
}

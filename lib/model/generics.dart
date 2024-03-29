/*
Generics
  - Generics are often required for type safety.
    If you intend for a list to contain only strings, you can declare it as List<String> (read that as “list of string”). 
    That way you, your fellow programmers, and your tools can detect that assigning a non-string to the list is probably a mistake. 

    var names = <String>[];
    names.addAll(['Seth', 'Kathy', 'Lars']);
    names.add(42); // ERR

  - Another reason for using generics is to reduce code duplication. 
    Generics let you share a single interface and implementation between many types, while still taking advantage of static analysis.


See Box<T> in model/box.dart with a generic type parameter.

 */

// In this code, K and V are the stand-in type. They are placeholders that you can think of as a type that a developer will define later.
class Pair<K, V> {
  final K key;
  final V value;

  const Pair(this.key, this.value);

  @override
  String toString() => "Pair($key: $value)";
}

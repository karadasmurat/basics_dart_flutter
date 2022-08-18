enum ProductType { x, y }

// Dart does not support interface keyword.
// We can use abstract to define interfaces.
abstract class Product {
  String name;
  Product(this.name);
  void design();
  @override
  String toString() => "{name: $name}";
}

class ConcreteProductX extends Product {
  ConcreteProductX(super.name);
  @override
  void design() {
    print("Product X..");
  }
}

class ConcreteProductY extends Product {
  ConcreteProductY(super.name);
  @override
  void design() {
    print("Product Y.");
  }
}

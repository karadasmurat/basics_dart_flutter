void main(List<String> args) {
  //create concrete base component
  Beverage beverage01 = HouseBlend();
  Beverage beverage02 = HouseBlend(description: "House-Blend");

  print(beverage01);
  print(beverage02);

  var soymilkAddOn = SoyMilk(component: beverage01);
  print(soymilkAddOn.cost());
}

abstract class Beverage {
  String description;

  Beverage({this.description = "Beverage"});

  num cost(); // Abstract method.
}

// Concrete implementation we would like to decorate.
class HouseBlend extends Beverage {
  @override
  num cost() {
    return 1;
  }

  // Unnamed Constructor
  HouseBlend({super.description = "Best HouseBlend"});

  /// A string representation of this object.
  @override
  String toString() {
    return "Instance of '$runtimeType', description: $description";
  }
}

// Decorator base class
abstract class BeverageDecorator extends Beverage {}

//Concrete implementation of Decorator
class SoyMilk extends BeverageDecorator {
  Beverage component;

  // Unnamed Constructor
  SoyMilk({required this.component});

  @override
  num cost() {
    return 2 + component.cost();
  }
}

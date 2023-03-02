import '../../../model/shape.dart';

void main(List<String> args) {
  // Simple Factory Method
  // Based on the type passed into the static method of SimpleFactory class,
  // we are returning the original concrete object as the abstract base - Shape.
  Shape circle01 = SimpleShapeFactory.createShape(ShapeType.circle);
  Shape rect01 = SimpleShapeFactory.createShape(ShapeType.rectangle);

  print("Simple Factory created: $circle01");
  print("Simple Factory created: $rect01");

  // Factory constructor
  // The same logic as the simple factory method above, implemented as a constructor of the abstract base - Shape.
  Shape circle02 = Shape.create(ShapeType.circle);
  Shape rect02 = Shape.create(ShapeType.rectangle);

  print("factory constructor created: $circle02");
  print("factory constructor created: $rect02");
  circle02.draw();
  rect02.draw();

  // Factory Pattern
  // A concrete 'Creator' for each concrete 'Product'
  ShapeFactory sf;

  sf = CircleFactory();
  Shape c = sf
      .createShape(); // Note that the signature does not change for the concrete product
  print(c);

  sf = RectangleFactory();
  Shape r = sf
      .createShape(); // Note that the signature does not change for the concrete product
  print(r);
}

// Simple Factory Method implemented as a static method
class SimpleShapeFactory {
  //Objects to be created belong to the same Product (Shape - base class),
  //and the specific object type to be created is determined by the parameter.
  //We don't have to care about the specific logic of how production is produced.
  static Shape createShape(ShapeType st) {
    switch (st) {
      case ShapeType.circle:
        return Circle("black", radius: 11);
      case ShapeType.rectangle:
        return Rectangle("black", height: 11, width: 22);
    }
  }
}

// 'Base' for the 'Creator'.
// Objects to be created belong to the same 'Product' (Shape - base class),
abstract class ShapeFactory {
  Shape createShape();
}

// 'concrete' implementation of the creator.
// creating concrete class, ie 'Circle', which is of base type 'Shape'
class CircleFactory implements ShapeFactory {
  //TODO how can we provide these parameters at runtime?

  // Note that the return type is still 'base' product (Shape)
  @override
  Shape createShape() {
    return Circle("red", radius: 1);
  }
}

// 'concrete' implementation of the creator.
// creating concrete class, ie 'Rectangle', which is of base type 'Shape'
class RectangleFactory implements ShapeFactory {
  //TODO how can we provide these parameters at runtime?
  @override
  Shape createShape() {
    return Rectangle("blue", height: 10, width: 20);
  }
}

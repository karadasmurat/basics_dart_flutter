enum ShapeType { triangle, rectangle }

// Abstract Class
abstract class Shape {
  //String name;

  factory Shape.forType(ShapeType type) {
    switch (type) {
      case ShapeType.triangle:
        return Triangle._internal();
      case ShapeType.rectangle:
        return Rectangle();
    }
  }
  // Abstract Method
  // num area();

  void draw() {
    print("Drawing a shape..");
  }
}

class Rectangle implements Shape {
  @override
  void draw() {
    print("Drawing a rectangle..");
  }
}

class Triangle implements Shape {
  // A constructor can be made private by using (_) underscore operator
  // So now, The class  doesn't have a default constructor
  Triangle._internal();

  @override
  void draw() {
    print("Drawing a triangle..");
  }
}

void main(List<String> args) {
  // Abstract classes cant be instantiated.
  // Shape s = Shape();

  Shape shape01 = Shape.forType(ShapeType.rectangle);
  shape01.draw();

  Shape shape02 = Shape.forType(ShapeType.triangle);
  shape02.draw();
}

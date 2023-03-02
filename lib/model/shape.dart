import 'dart:math';

enum ShapeType { circle, rectangle }

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x, y;

  // When initializing fields is the single goal of the constructor, body { } is optional.

  // Do not use Constructor Body only to initialize variables using the arguments passed to constructor.
  // If instance fields are non nullable or final, this would give an ERR.
  // syntactic sugar or initializer list executes before the body, thus initialize fields, preventing this initialization ERR. late variables also OK.
  // Point.traditional(int a, int b) {
  //  x = a;
  //  y = b;
  // }

  // Named Constructor, without syntactic sugar (using initializers)
  // Initializer list to initialize variables. (Positional Arguments)
  Point.origin()
      : x = xOrigin, // global const, 0
        y = yOrigin;

  // Constructor with syntactic sugar to initialize variables. (Positional Arguments)
  Point(this.x, this.y);

  // Delegate to another constructor:
  // Sometimes a constructor’s only purpose is to redirect to another constructor in the same class.
  // A redirecting constructor’s body is empty, with the constructor call (using this instead of the class name) appearing after a colon (:).
  Point.alongXAxis(double x) : this(x, 0);

  // Named Constructor Initializer list sets instance variables before the constructor body runs.
  Point.fromJson(Map<String, double> arg)
      : x = arg['x']!,
        y = arg['y']! {
    print("In Point.fromJson(): ($x, $y)");
  }

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  // The hashCode property of Object class represents hash code for this object.
  // A hash code is a single integer which represents the state of the object that affects operator == comparisons.
  // If a subclass overrides hashCode, it should override the operator == operator as well to maintain consistency.
  // Since version 2.14, use the static hashing methods provided by the `Object` class.
  @override
  int get hashCode => Object.hash(x, y); // x.hashCode ^ y.hashCode;

  // The equality operator of the Object class, the signature has parameter type 'Object'
  @override
  bool operator ==(Object other) {
    return other is Point && x == other.x && y == other.y;
  }

  @override
  String toString() {
    return 'Point("x":$x, "y":$y)';
  }
}

abstract class Shape {
  String color;

  Shape(this.color);

  // Factory constructor
  // The same logic as a simple factory method.
  factory Shape.create(ShapeType st) {
    switch (st) {
      case ShapeType.circle:
        return Circle("black", radius: 11);
      case ShapeType.rectangle:
        return Rectangle("black", height: 11, width: 22);
    }
  }

  double area(); //abstract method, no body.
  void draw(); //abstract method, no body.
}

class Circle extends Shape {
  double radius;
  Circle(super.color, {required this.radius});

  @override
  double area() => pi * radius * radius;

  @override
  void draw() {
    print("Drawing Circle(color: $color, radius: $radius)");
  }

  @override
  String toString() => "Circle(color: $color, radius: $radius)";
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(super.color, {required this.height, required this.width});

  @override
  double area() => width * height;

  @override
  void draw() {
    print("Drawing Rectangle(color: $color, width: $width, height: $height).");
  }

  @override
  String toString() => "Rectangle(color: $color, width: $width, height: $height)";
}

import 'dart:math' as math;

abstract class Shape {
  String color;

  Shape(this.color);

  double area(); //abstract method, no body.
  void draw(); //abstract method, no body.
}

class Circle extends Shape {
  double radius;
  Circle(super.color, {required this.radius});

  @override
  String toString() => "A $color Circle with radius $radius";

  @override
  double area() => math.pi * radius * radius;

  @override
  void draw() {
    print("Drawing a circle.");
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(super.color, {required this.height, required this.width});

  @override
  double area() => width * height;

  @override
  void draw() {
    print("Drawing a rectangle.");
  }

  @override
  String toString() =>
      "A $color Rectangle with width: $width and height: $height";
}

// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines data commonly used by Patterns tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

library patterns_lib;

String shapesLog = "";

void logger(String log) {
  shapesLog = shapesLog.isEmpty ? log : "$shapesLog, log";
}

void clearLog() {
  shapesLog = "";
}

class Shape {
  void Function(String s) _logger = (String s) {};
  double get area {
    _logger("Shape.area");
    return 0;
  }

  Shape();
  Shape.withLog() : this._withLog(logger);
  Shape._withLog(this._logger);
}

class Square extends Shape {
  final double length;

  Square(this.length);
  Square.withLog(this.length) : super._withLog(logger);

  double get area {
    _logger("Square.area");
    return length * length;
  }
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
  Circle.withLog(this.radius) : super._withLog(logger);

  double get area {
    _logger("Circle.area");
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  final double x, y;
  Rectangle(this.x, this.y);
  Rectangle.withLog(this.x, this.y) : super._withLog(logger);

  double get area => x * y;
}

class Point extends Shape {
  Point();
  Point.withLog() : super._withLog(logger);
  Never get area {
    _logger("Point.area");
    throw Exception("Point has no area");
  }
}

// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines data commonly used by Patterns tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

library patterns_lib;

class Area {
  final double value;
  final void Function(String s)? _logger;
  const Area(this.value) : _logger = null;
  const Area.withLogger(this.value, this._logger);

  @override
  bool operator ==(Object other) {
    final _log = _logger;
    final tolerance = 0.001;
    if (other is Area) {
      if (_log != null) {
        _log("=$other;");
      }
      return (this.value - other.value).abs() <= tolerance;
    }
    if (other is int) {
      if (_log != null) {
        _log("=$other;");
      }
      return (this.value - other).abs() <= tolerance;
    }
    if (other is double) {
      if (_log != null) {
        _log("=${other.toStringAsFixed(2)};");
      }
      return (this.value - other).abs() <= tolerance;
    }
    return false;
  }

  @override
  String toString() => "Area($value)";
}

class Shape {
  String _log = "";
  Shape();

  void logger(String toAppend) {
    _log = _log.isEmpty ? toAppend : "$_log$toAppend";
  }

  Area get area {
    logger("Shape.area");
    return Area.withLogger(0, logger);
  }

  String get log => _log;
}

class Square extends Shape {
  final double length;

  Square(this.length);

  Area get area {
    logger("Square.area");
    return Area.withLogger(length * length, logger);
  }
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  Area get area {
    logger("Circle.area");
    return Area.withLogger(3.14 * radius * radius, logger);
  }
}

class Rectangle extends Shape {
  final double x, y;

  Rectangle(this.x, this.y);

  Area get area {
    logger("Rectangle.area");
    return Area.withLogger(x * y, logger);
  }
}

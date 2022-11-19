// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines data commonly used by Patterns tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

library patterns_lib;

const Zero = 0;
const Pi = 3.14;
const Answer = 42;
const MaxJSInt = 0x1FFFFFFFFFFFFF;
const Melody = "Lily was here";
const True = true;
const False = false;

class C0 {
  static const Zero = 0;
  static const Pi = 3.14;
  static const Answer = 42;
  static const MaxJSInt = 0x1FFFFFFFFFFFFF;
  static const Melody = "Lily was here";
  static const True = true;
  static const False = false;
}

enum Color {
  white,
  red,
  yellow,
  blue,
  black;
}

class Unit {
  final double value;
  final void Function(String s)? _logger;
  const Unit(this.value) : _logger = null;
  const Unit.withLogger(this.value, this._logger);

  @override
  bool operator ==(Object other) {
    final _log = _logger;
    final tolerance = 0.001;
    if (other is Unit) {
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
  String toString() => value.toStringAsFixed(2);
}

class Shape {
  String _log = "";
  Shape();

  void logger(String toAppend) {
    _log = _log.isEmpty ? toAppend : "$_log$toAppend";
  }

  Unit get area {
    logger("Shape.area");
    return Unit.withLogger(0, logger);
  }

  Unit get size {
    logger("Shape.size");
    return Unit.withLogger(0, logger);
  }

  String get log => _log;
}

class Square extends Shape {
  final double length;

  Square(this.length);

  @override
  Unit get area {
    logger("Square.area");
    return Unit.withLogger(length * length, logger);
  }

  @override
  Unit get size {
    logger("Square.size");
    return Unit.withLogger(length, logger);
  }
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  Unit get area {
    logger("Circle.area");
    return Unit.withLogger(3.14 * radius * radius, logger);
  }

  @override
  Unit get size {
    logger("Circle.size");
    return Unit.withLogger(radius, logger);
  }
}

class Rectangle extends Shape {
  final double x, y;

  Rectangle(this.x, this.y);

  @override
  Unit get area {
    logger("Rectangle.area");
    return Unit.withLogger(x * y, logger);
  }

  @override
  Unit get size {
    logger("Rectangle.size");
    return Unit.withLogger(x, logger);
  }
}

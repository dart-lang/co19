// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines data commonly used by Patterns tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

library patterns_lib;

const Zero = 0;
const Pi = 3.14;
const Answer = 42;
const Negative = -1;
const NegativePi = -3.14;
const MaxJSInt = 0x1FFFFFFFFFFFFF;
const Melody = "Lily was here";
const True = true;
const False = false;

class C0 {
  static const Zero = 0;
  static const Pi = 3.14;
  static const Answer = 42;
  static const Negative = -1;
  static const NegativePi = -3.14;
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

abstract class MetricUnits {
}

class Centimeter extends MetricUnits {
}

class Meter extends MetricUnits {
}


class Unit<T extends MetricUnits> {
  static final tolerance = 0.001;
  final double value;
  final void Function(String s)? _logger;
  const Unit(this.value, [this._logger = null]);

  @override
  bool operator ==(Object other) {
    final _log = _logger;
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
  String toString() => value.toStringAsFixed(2).replaceFirst(".00", "");
}

class Shape<T extends MetricUnits> {
  static const Area = "area";

  final void Function(String s)? logFunction;
  const Shape([this.logFunction = null]);

  void _log(String toLog) {
    void Function(String s)? _l = logFunction;
    if (_l != null) {
      _l(toLog);
    }
  }

  Unit<T> get area {
    _log("Shape.area");
    return Unit(0, logFunction);
  }

  Unit<T> get size {
    _log("Shape.size");
    return Unit(0, logFunction);
  }

  double get areaAsDouble => 0;
  double get sizeAsDouble => 0;
  int get areaAsInt => areaAsDouble.toInt();
  int get sizeAsInt => sizeAsDouble.toInt();
  num? get areaAsNullable => areaAsDouble;
  num? get sizeAsNullable => sizeAsDouble;
  num? get areaAsNull => null;
  num? get sizeAsNull => null;
  List<num> get areaAsList => [areaAsDouble];
  Map<String, num> get areaAsMap => {Area: areaAsDouble};
  ({num area}) get areaAsRecord => (area: areaAsDouble);
}

class Square<T extends MetricUnits> extends Shape<T> {
  final double length;

  const Square(this.length, [void Function(String s)? logFunction = null])
      : super(logFunction);

  @override
  Unit<T> get area {
    _log("Square.area");
    return Unit(length * length, logFunction);
  }

  @override
  Unit<T> get size {
    _log("Square.size");
    return Unit(length, logFunction);
  }

  @override
  double get areaAsDouble => length * length;
  @override
  double get sizeAsDouble => length;
}

class Circle<T extends MetricUnits> extends Shape<T> {
  final double radius;

  const Circle(this.radius, [void Function(String s)? logFunction = null])
      : super(logFunction);

  @override
  Unit<T> get area {
    _log("Circle.area");
    return Unit(3.14 * radius * radius, logFunction);
  }

  @override
  Unit<T> get size {
    _log("Circle.size");
    return Unit(radius, logFunction);
  }

  @override
  double get areaAsDouble => 3.14 * radius * radius;
  @override
  double get sizeAsDouble => radius;
}

class Rectangle<T extends MetricUnits> extends Shape<T> {
  final double x, y;

  Rectangle(this.x, this.y, [void Function(String s)? logFunction = null])
      : super(logFunction);

  @override
  Unit<T> get area {
    _log("Rectangle.area");
    return Unit(x * y, logFunction);
  }

  @override
  Unit<T> get size {
    _log("Rectangle.size");
    return Unit(x, logFunction);
  }

  @override
  double get areaAsDouble => x * y;
  @override
  double get sizeAsDouble => x;
}

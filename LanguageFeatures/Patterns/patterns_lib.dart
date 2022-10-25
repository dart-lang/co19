// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines data commonly used by Patterns tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

library patterns_lib;

abstract class Shape {
  double get area;
}

class Square implements Shape {
  final double length;
  Square(this.length);

  double get area => length * length;
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);

  double get area => 3.14 * radius * radius;
}

class Rectangle implements Shape {
  final double x, y;
  Rectangle(this.x, this.y);

  double get area => x * y;
}

class Point implements Shape {
  Point();
  Never get area => throw Exception("Point has no area");
}

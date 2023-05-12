// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • An expression of the form e1 == e2 is potentially constant if e1 and e2
///   are both potentially constant expressions. It is further constant if both
///   e1 and e2 are constant, and either e2 evaluates to the null object
///
/// @description Checks that it is not an error when an expression of the form
/// e1 == e2 or e1 != e2 is used to initialize a constant variable and both `e1`
/// and `e2` are potentially constant expressions.
/// @author kaigorodov

class A {
  const A() : a = "hello";
  final a;
}

class B {
  final x;
  const B(this.x);
  @override
  bool operator ==(Object other) {
    if (other is B) {
      return this.x == other.x;
    }
    return false;
  }
}

final constList = const [
  const A() == "hello",
  const A() != "world",
  3.14 == A(),
  B(1) == null,
  A() != null
];

main() {
  print(constList);
}

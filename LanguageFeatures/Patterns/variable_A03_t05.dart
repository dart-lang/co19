// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// variablePattern ::= ( 'var' | 'final' | 'final'? type )? identifier
///
/// A variable pattern binds the matched value to a new variable. These usually
/// occur as subpatterns of a destructuring pattern in order to capture a
/// destructured value.
/// ```dart
/// var (a, b) = (1, 2);
/// ```
/// Here, a and b are variable patterns and end up bound to 1 and 2,
/// respectively.
///
/// The pattern may have a type annotation in order to only match values of the
/// specified type. If the type annotation is omitted, the variable's type is
/// inferred and the pattern matches all values.
/// ```dart
/// switch (record) {
///   case (int x, String s):
///     print('First field is int $x and second is String $s.');
/// }
/// ```
/// @description Check that if variable in a variable pattern is declared final
/// then it is a compile-time error to assign a value to ity. Test Object
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";

void test1(Shape shape) {
  switch (shape) {
    case Square(area: final s):
      s = Unit(1);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(area: final Unit s):
      s = Unit(1);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
    case Circle(area: final Unit? s):
      s = Unit(1);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Unit? test2(Shape shape) {
  return switch (shape) {
    case Square(area: final s) => s = Unit(1);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(area: final Unit s) => s = Unit(1);
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(area: final Unit? s) => s = Unit(1);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
    default => Unit(42);
  };
}

void test3(Shape shape) {
  if (shape case Square(area: final s)) {
    s = Unit(1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (shape case Circle(area: final Unit s)) {
    s = Unit(1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (shape case Circle(area: final Unit? s)) {
    s = Unit(1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  test1(Square(1));
  test2(Square(1));
  test3(Square(1));
}

// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// As with record patterns, the getter name can be omitted and inferred from
/// the variable pattern in the field subpattern which may be wrapped in a unary
/// pattern
///
/// @description Checks that it is a compile-time error if an object pattern
/// with omitted getter name have subpatterns other than variable, cast, null
/// check/assert or parenthesized. Test a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(Shape shape) {
  return switch (shape) {
    Rectangle(:var areaAsInt || var areaAsInt) => "logical-or",
//                           ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle(:final areaAsInt && int sizeAsInt) => "logical-and",
//                             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle(: > 5) => "relational",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Square(: 42) => "constant",
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle(: [var areaAsList]) => "list",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle(: {"area": var m1}) => "map",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle(: (area: var areaAsRecord))  => "record",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Square(: Unit(value: var area)) => "object",
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

main() {
  test(Rectangle(1, 4));
}

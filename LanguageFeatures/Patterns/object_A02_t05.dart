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
/// with omitted getter name have subpatterns other than variable, cast or null
/// check/assert. Test a switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(Shape shape) {
  switch (shape) {
    case Rectangle(:var areaAsInt || var areaAsInt): return "logical-or";
//                                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(:final areaAsInt && int sizeAsInt): return "logical-and";
//                                  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(: > 5): return "relational";
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    case Square(: 42): return "constant";
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(: [var areaAsList]): return "list";
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(: {"area": var m1}): return "map";
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(: (area: var areaAsRecord)): return "record";
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    case Square(: Unit(value: var area)): return "object";
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      return "default";
  }
}

main() {
  test(Rectangle(1, 4));
}

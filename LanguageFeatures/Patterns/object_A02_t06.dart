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
/// check/assert or parenthesized. Test an if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

void test(Shape shape) {
  if (shape case Rectangle(:var areaAsInt || var areaAsInt)) {}
//                                        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Rectangle(:final areaAsInt && int sizeAsInt)) {}
//                                          ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Rectangle(: > 5)) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Square(: 42)) {}
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Rectangle(: [var areaAsList])) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Rectangle(: {"area": var m1})) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Rectangle(: (area: var areaAsRecord))) {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Square(: Unit(value: var area))) {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test(Rectangle(1, 4));
}

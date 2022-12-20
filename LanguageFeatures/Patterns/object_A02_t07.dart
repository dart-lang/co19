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
/// check/assert or parenthesized. Test declaration context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

void test(Shape shape) {
  var Rectangle(:var areaAsInt || var areaAsInt) = Rectangle(1, 2);
//                             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final Rectangle(:final areaAsInt && int sizeAsInt) = Rectangle(1, 2);
//                                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var Rectangle(: > 5) = Rectangle(1, 2);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  final Square(: 42) = Square(1);
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  var Rectangle(: [var areaAsList]) = Rectangle(1, 2);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  final Rectangle(: {"area": var m1}) = Rectangle(1, 2);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  var Rectangle(: (area: var areaAsRecord)) = Rectangle(1, 2);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  final Square(: Unit(value: var area)) = Square(1);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test(Rectangle(1, 4));
}

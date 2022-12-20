// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion objectPattern ::= typeName typeArguments? '(' patternFields? ')'
/// ...
/// It is a compile-time error if:
///
/// `typeNam`e does not refer to a type.
///
/// A type argument list is present and does not match the arity of the type of
/// `typeName`.
///
/// A `patternField` is of the form `pattern`. Positional fields aren't allowed.
///
/// Any two named fields have the same name. This applies to both explicit and
/// inferred field names.
///
/// It is a compile-time error if a name cannot be inferred for a named getter
/// pattern with the getter name omitted (see name inference below).
///
/// @description Checks that it is a compile-time error if a `patternField` is
/// of the form `pattern`. Test a switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(Shape shape) {
  return switch (shape) {
    Rectangle(> 3 || 2) => "logical-or",
//            ^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle<Meter>( > 3 || 2) => "logical-or-2",
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle( > 0 && < 10) => "logical-and",
//             ^
// [analyzer] unspecified
// [cfe] unspecified
    Rectangle( > 5) => "relational",
//             ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(var c1 as num) => "cast",
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  Circle(final c2 as num) => "cast-2",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Circle(var a1?) => "null-check",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Circle(var a2?) => "null-check-2",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Circle(var b1!) => "null-assert",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Square(1) => "constant",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle(int s1) => "variable-1",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle(var s2) => "variable-2",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle(final int s3) => "variable-3",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle(final s4) => "variable-4",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Square((var x)) => "parenthesized",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle([var l1]) => "list",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle([5]) => "list-2",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle({"area": var m1}) => "map",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle({"area": 3}) => "map-2",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle((area: var x1)) => "record",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Rectangle((area: 1)) => "record-2",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  Square(Unit(value: 3)) => "object-1",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  Square(Unit(value: var o1)) => "object-2",
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  _ => "default"
  };
}

main() {
  test(Shape());
}

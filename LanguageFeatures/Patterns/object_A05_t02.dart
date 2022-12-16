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
/// of the form `pattern`. Test a switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(Shape shape) {
  switch (shape) {
    case Rectangle(> 3 || 2): return "logical-or";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle<Meter>( > 3 || 2): return "logical-or-2";
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle( > 0 && < 10): return "logical-and";
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle( > 5): return "relational";
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(var c1 as num): return "cast";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(final c2 as num): return "cast-2";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(var a1?): return "null-check";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(var a2?): return "null-check-2";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(var b1!): return "null-assert";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Square(1): return "constant";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(int s1): return "variable-1";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(var s2): return "variable-2";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(final int s3): return "variable-3";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle(final s4): return "variable-4";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Square((var x)): return "parenthesized";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle([var l1]): return "list";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle([5]): return "list-2";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle({"area": var m1}): return "map";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle({"area": 3}): return "map-2";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle((area: var x1)): return "record";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Rectangle((area: 1)): return "record-2";
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    case Square(Unit(value: 3)): return "object-1";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    case Square(Unit(value: var o1)): return "object-2";
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  default:
    return "default";
  }
}

main() {
  test(Shape());
}

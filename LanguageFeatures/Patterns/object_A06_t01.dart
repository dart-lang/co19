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
/// @description Checks that it is a compile-time error if any two named fields
/// have the same name
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

String test1(Shape shape) => switch(shape) {
    Rectangle(areaAsInt: var x, areaAsInt: final y) => "matched-1",
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(areaAsInt: var x, :areaAsInt) => "matched-2",
//                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Square(:areaAsInt, :areaAsInt) => "matched-3",
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
   _ => ""
};

String test2(Shape shape) {
  switch (shape) {
    case Rectangle(areaAsInt: var x, areaAsInt: final y): return "matched-1";
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Circle(areaAsInt: var x, :areaAsInt): return "matched-2";
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case Square(:areaAsInt, :areaAsInt): return "matched-3";
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    default: return "";
  }
}

void test3(Shape shape) {
  if (shape case Rectangle(areaAsInt: var x, areaAsInt: final y)) {}
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Circle(areaAsInt: var x, :areaAsInt)) {}
//                                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  if (shape case Square(:areaAsInt, :areaAsInt)) {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  Rectangle(areaAsInt: var x1, areaAsInt: final y1) = Rectangle(1, 2);
//                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Circle(areaAsInt: var x2, :areaAsInt) = Circle(1);
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(:areaAsInt, :areaAsInt) = Square(1);
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  test1(Shape());
  test2(Shape());
  test3(Shape());
}

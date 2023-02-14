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
/// @description Checks that it is a compile-time error if a name cannot be
/// inferred for a named getter pattern with the getter name omitted. Test
/// switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

String test(Shape shape) {
  return switch (shape) {
    Circle(:var _ as num) => "case-1",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final _ as num) => "case-2",
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:int _ as num) => "case-3",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final int _ as num) => "case-4",
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(: _ as num) => "case-5",
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:var _?) => "case-6",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final _?) => "case-7",
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:int _?) => "case-8",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final int _?) => "case-9",
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:_?) => "case-10",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:var _!) => "case-11",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final _!) => "case-12",
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:int _!) => "case-13",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final int _!) => "case-14",
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:_!) => "case-15",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:var _) => "case-16",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final _) => "case-17",
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:int _) => "case-18",
//              ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:final int _) => "case-19",
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:_) => "case-20",
//          ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:(var _)) => "case-21",
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:(final _)) => "case-22",
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:(int _)) => "case-23",
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:(final int _)) => "case-24",
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
    Circle(:(_)) => "case-25",
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => ""
  };
}

main() {
  test(Shape());
}

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
/// switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  Shape shape = Shape();
  switch (shape) {
    case Circle(:var _ as num):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final _ as num):
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:int _ as num):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final int _ as num):
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(: _ as num):
//                ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:var _?):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final _?):
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:int _?):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final int _?):
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:_?):
//               ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:var _!):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final _!):
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:int _!):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final int _!):
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:_!):
//               ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:var _):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final _):
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:int _):
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:final int _):
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:_):
//               ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:(var _)):
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:(final _)):
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:(int _)):
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:(final int _)):
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(:(_)):
//           ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
  }
}

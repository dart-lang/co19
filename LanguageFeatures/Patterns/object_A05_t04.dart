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
/// of the form `pattern`. Test declaration context
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

main() {
  var Rectangle( > 0 && < 10) = Rectangle(2, 1);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  final Rectangle( > 5) = Rectangle(2, 1);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  var Circle(int c1 as num) = Circle(1);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  final Circle(int b1!) = Circle(1);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
  var Rectangle(int s1) = Rectangle(2, 1);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  final Square((int x)) = Square(2);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  var Rectangle([int l1]) = Rectangle(2, 1);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  final Rectangle({"area": int m1}) = Rectangle(2, 1);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  var Rectangle((area: var x1)) = Rectangle(2, 1);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  final Square(Unit(value: var o1)) = Square(2);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

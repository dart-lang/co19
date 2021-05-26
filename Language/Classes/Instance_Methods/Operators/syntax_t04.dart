// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// operator:
///   ‘˜’ |
///   binaryOperator |
///   ‘[’ ‘]’ |
///   ‘[’ ‘]’ ‘=’
/// ;
/// binaryOperator:
///   multiplicativeOperator |
///   additiveOperator |
///   shiftOperator |
///   relationalOperator |
///   ‘==’ |
///   bitwiseOperator
/// ;
/// @description Checks that it is a compile-time error if a class defines an
/// operator without a formal parameter list.
/// @author iefremov


class C {
  int operator - {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    C c = new C();
    var x = -c;
  } catch (x) {}
}

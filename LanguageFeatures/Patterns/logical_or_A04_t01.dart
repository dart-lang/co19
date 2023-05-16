// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion logicalOrPattern ::= ( logicalOrPattern '||' )? logicalAndPattern
///
/// A pair of patterns separated by || matches if either of the branches match
///
/// A logical-or pattern may match even if one of its branches does not. That
/// means that any variables in the non-matching branch would not be
/// initialized. To avoid problems stemming from that, the following
/// restrictions apply:
///
/// The two branches must define the same set of variables.
///
/// If the left branch matches, the right branch is not evaluated. This
/// determines which value the variable gets if both branches would have
/// matched. In that case, it will always be the value from the left branch.
///
/// @description Checks that it is a compile-time error if two branches of
/// logical-or pattern define different sets of variables. Test switch statement
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

main() {
  Shape shape = Circle(1);
  switch (shape) {
    case Square(area: var s1) || Circle(area: var s2):
//                                                ^^
// [analyzer] unspecified
// [cfe] unspecified
      print("Square or Circle");
      break;
    case Square(area: var s1) || Circle(area: _):
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified
      print("Square or Circle");
      break;
    case Rectangle(x: var x, y: var width) || Rectangle(:var x, :var y):
//                                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
      print("Rectangle");
      break;
    default:
      print("Other");
  }
}

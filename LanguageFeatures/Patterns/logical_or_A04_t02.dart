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
/// logical-or pattern define different sets of variables. Test switch
/// expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";

String test(Shape shape) {
  return switch (shape) {
    Square(area: var s1) || Circle(area: var s2) => "Square or Circle",
//                                           ^^
// [analyzer] unspecified
// [cfe] unspecified
    Square(area: var s1) || Circle(area: _) => "Square or Circle 2",
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

    Rectangle(x: var x, y: var width) || Rectangle(:var x, :var y)
//                                                              ^
// [analyzer] unspecified
// [cfe] unspecified
      => "Rectangle",
    _ => "Other"
  };
}

main() {
  test(Circle(1));
}

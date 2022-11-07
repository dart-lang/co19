// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// logicalAndPattern ::= ( logicalAndPattern '&' )? relationalPattern
///
/// A pair of patterns separated by & matches only if both subpatterns match.
/// Unlike logical-or patterns, the variables defined in each branch must not
/// overlap, since the logical-and pattern only matches if both branches do and
/// the variables in both branches will be bound.
///
/// If the left branch does not match, the right branch is not evaluated. This
/// only matters because patterns may invoke user-defined methods with visible
/// side effects.
///
/// @description Checks that it is a compile-time error if two branches of
/// logical-and pattern define overlapping sets of variables
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";

main() {
  Shape shape = Circle(1);
  switch (shape) {
    case Circle(area: var s) & Circle(area: var s):
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Rectangle(x: var x, y: var width) & Rectangle(:var x, :var y):
//                                                          ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case Circle(area: var s1) & Circle(area: var s2) & Circle(area: var s1):
//                                                                      ^^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      print("Other");
  }
}

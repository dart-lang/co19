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
/// @description Checks a logical-and pattern in a switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "patterns_lib.dart";
import "../../Utils/expect.dart";

void test(int value, bool match) {
  switch (value) {
    case > 0 & <= 3:
      Expect.isTrue(match);
      break;
    default:
      Expect.isFalse(match);
  }
}

main() {
  test(1, true);
  test(2, true);
  test(3, true);
  test(0, false);
  test(4, false);
}

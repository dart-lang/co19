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
/// @description Checks logical-or pattern with logical-and subpattern in a
/// switch expression
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

bool matches(int value) => switch (value) {
  > -10 && <= 1 || >= 4 && < 10 => true,
  _ => false
};

main() {
  Expect.isFalse(matches(-10));
  Expect.isFalse(matches(10));
  Expect.isFalse(matches(2));
  Expect.isFalse(matches(3));
  Expect.isTrue(matches(-9));
  Expect.isTrue(matches(-1));
  Expect.isTrue(matches(0));
  Expect.isTrue(matches(1));
  Expect.isTrue(matches(4));
  Expect.isTrue(matches(9));
}

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
/// @description Checks logical-or subpattern in a switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

bool matches(List list) {
  switch (list) {
    case [1 || 2, 3]:
      return true;
    default:
  };
  return false;
}

main() {
  Expect.isFalse(matches([0, 3]));
  Expect.isFalse(matches([2, 2]));
  Expect.isFalse(matches([2, 3, 4]));
  Expect.isFalse(matches([2, "3"]));
  Expect.isFalse(matches(["1", 3]));
  Expect.isTrue(matches([1, 3]));
  Expect.isTrue(matches([2, 3]));
}

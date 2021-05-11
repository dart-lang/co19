// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Continue statement: If N is a statement of the form continue [L];
/// then:
///
///  Let S be the statement targeted by the continue. If L is not present, this
///  is the innermost do, for, or while statement. Otherwise it is the do, for,
///  or while statement with a label matching L, or the switch statement
///  containing a switch case with a label matching L.
///
///  Update continue(S) = join(continue(S), before(N)).
///
///  Let after(N) = unreachable(before(N)).
///
/// @description Checks reachability after continue statement. Test for loop and
/// a label
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../../Utils/expect.dart";

main() {
  late int i;
  outerLoop:
  for (int j = 0; j < 3; j++) {
    for (;;) {
      continue outerLoop;
      i = 42; // Variable is initialized in a dead code
    }
  }
  try {
    // 'i' is treated here by flow analysis as possibly assigned, so it is a
    // runtime (not a compile time) error to read it
    i;
    Expect.fail("Error expected");
  } on Error {
    // Ok, expected
  }
}

// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Break statement: If N is a statement of the form break [L];, then:
///
///  Let S be the statement targeted by the break. If L is not present, this is
///  the innermost do, for, switch, or while statement. Otherwise it is the do,
///  for, switch, or while statement with a label matching L.
///
///  Update break(S) = join(break(S), before(N)).
///
///  Let after(N) = unreachable(before(N)).
///
/// @description Checks reachability after break statement. Test for-in loop and
/// a label. The outer loop is do
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../../Utils/expect.dart";

main() {
  late int i;
  var collection = [3, 1, 4, 1, 5];
  outerLoop:
  do {
    for (var v in collection) {
      break outerLoop;
      i = 42; // Variable is initialized in a dead code
    }
  } while (false);
  try {
    // 'i' is treated here by flow analysis as possibly assigned, so it is a
    // runtime (not a compile time) error to read it
    i;
    Expect.fail("Error expected");
  } on Error {
    // Ok, expected
  }
}

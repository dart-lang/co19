// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Switch statement
/// 1. Evaluate the switch value producing v.
/// 2. For each case:
///   i. Match the case's pattern against v. If the match fails then continue to
///     the next case (or default clause or exit the switch if there are no
///     other cases).
///   ii. If there is a guard clause, evaluate it. If it does not evaluate to a
///     Boolean, throw a runtime error. This can happen if the guard
///     expression's type is dynamic. If it evaluates to false, continue to the
///     next case (or default or exit).
///   iii. Find the nearest non-empty case body at or following this case.
///     You're allowed to have multiple empty cases where all preceding ones
///     share the same body with the last case.
///   iv. If the enclosing scope for the body is a shared case scope, then
///     initialize all shared variables the values of the corresponding
///     variables from the case scope. There will be no shared case scope and
///     nothing to copy if the body is only used by a single case.
///   v. Execute the body statement.
///   vi. If execution of the body statement continues with a label, and that
///     label is labeling a switch case of this switch, go to step 3 and
///     continue from that label.
///   vii. Otherwise the switch statement completes normally. An explicit break
///     is no longer required.
/// 3. If no case pattern matched and there is a default clause, execute the
///   statements after it.
/// 4. If the static type of v is an always-exhaustive type, no case matches,
///   and there is no default clause, then throw a runtime error.
///
/// @description Check that body of the matched case is executed
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String log = "";

bool guard(int n, bool b) {
  log += "guard$n($b);";
  return b;
}

void test(List<int> list) {
  log = "";
  switch (list) {
    case [1, var v1] when guard(1, v1 == 1):
    case [2, final v2] when guard(2, v2 == 2):
    case [3, var v3] when guard(3, v3 == 3):
      log += "shared body;";
    case [4, var v4] when guard(4, v4 == 4):
      log += "not shared body;";
    default:
      log += "default;";
  }
}

main() {
  test([1, 1]);
  Expect.equals("guard1(true);shared body;", log);
  test([2, 2]);
  Expect.equals("guard2(true);shared body;", log);
  test([3, 3]);
  Expect.equals("guard3(true);shared body;", log);
  test([4, 4]);
  Expect.equals("guard4(true);not shared body;", log);
  test([1, 42]);
  Expect.equals("guard1(false);default;", log);
  test([2, 42]);
  Expect.equals("guard2(false);default;", log);
  test([3, 42]);
  Expect.equals("guard3(false);default;", log);
  test([4, 42]);
  Expect.equals("guard4(false);default;", log);
  test([]);
  Expect.equals("default;", log);
}

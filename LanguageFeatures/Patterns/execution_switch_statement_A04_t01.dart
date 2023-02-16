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
/// @description Check that if execution of the body statement continues with a
/// label, and that label is labeling a switch case of this switch, execution
/// continues from that label.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String log = "";

int guard(int n, int v) {
  log += "guard$n();";
  return v;
}

void testJumpForward(List<int> list) {
  log = "";
  switch (list) {
    case [1, var v1] when 1 == guard(1, v1):
      log += "case-1;";
      continue case3;
    case [1, final v2] when 2 == guard(2, v2):
      log += "case-2;";
    case3:
    case [1, var v3] when 3 == guard(3, v3):
      log += "case-3;";
    default:
      log += "default;";
  }
}

void testJumpBack(List<int> list) {
  log = "";
  switch (list) {
    case1:
    case [1, var v1] when 1 == guard(1, v1):
      log += "case-1;";
    case [1, final v2] when 2 == guard(2, v2):
      log += "case-2;";
    case [1, var v3] when 3 == guard(3, v3):
      log += "case-3;";
      continue case1;
    default:
      log += "default;";
  }
}

main() {
  testJumpForward([1, 1]);
  Expect.equals("guard1();case-1;case-3;", log);
  testJumpForward([1, 2]);
  Expect.equals("guard1();guard2();case-2;", log);
  testJumpForward([1, 3]);
  Expect.equals("guard1();guard2();guard3();case-3;", log);
  testJumpForward([]);
  Expect.equals("default;", log);

  testJumpBack([1, 3]);
  Expect.equals("guard1();guard2();guard3();case-3;case-1;", log);
  testJumpBack([1, 2]);
  Expect.equals("guard1();guard2();case-2;", log);
  testJumpBack([1, 1]);
  Expect.equals("guard1();case-1;", log);
  testJumpBack([]);
  Expect.equals("default;", log);
}

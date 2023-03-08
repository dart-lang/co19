// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Switch expression
/// 1. Evaluate the switch value producing v.
/// 2. For each case:
///   i. Match the case's pattern against v. If the match fails then continue to
///     the next case.
///   ii. If there is a guard clause, evaluate it. If it does not evaluate to a
///     `bool`, throw a runtime error. If it evaluates to false, continue to the
///     next case.
///   iii. Evaluate the expression after the case and yield that as the result
///     of the entire switch expression.
/// 3. If no case matches, throw a runtime error.
///
/// @description Check that if there is a guard clause it is evaluated
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String log = "";

bool guard(int v) {
  log += "guard($v);";
  return v == 42;
}

main() {
  var v = [0, 42];
  var x = switch (v) {
    [int v1, var v2] when guard(v1) => "case-1",
    [1, final v3] when guard(v3) => "case-2",
    [0, var v4] when guard(v4) => "case-3",
    _ => "default"
  };
  Expect.equals("case-3", x);
  Expect.equals("guard(0);guard(42);", log);
}

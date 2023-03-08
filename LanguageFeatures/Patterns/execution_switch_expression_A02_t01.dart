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
/// @description Check that it is a run-time error if guard value is not
/// assignable to bool
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

dynamic guard(v) => v;

String test(v) =>
  switch(42) {
    42 when guard(v) => "Case body",
    _ => "default"
  };

main() {
  Expect.equals("Case body", test(true));
  Expect.equals("default", test(false));
  Expect.throws(() {test(42);});
  Expect.throws(() {test(null);});
}

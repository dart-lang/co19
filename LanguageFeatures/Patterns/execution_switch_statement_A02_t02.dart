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
/// @description Check that it is a runtime error if guard value is not
/// assignable to bool
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

dynamic guard(v) => v;

String test(v) {
  switch(42) {
    case 42 when guard(v):
      return "Case body";
    default:
      return "default";
  }
}

main() {
  Expect.equals("Case body", test(true));
  Expect.equals("default", test(false));
  Expect.throws(() {test(42);});
}

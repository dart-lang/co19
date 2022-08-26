// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Let s1,...,sn be those try statements that are both enclosed in
/// sE and that enclose sc, and that have a finally clause. Lastly, let fj be
/// the finally clause of sj, 1 <= j <= n. Executing sc first executes f1,...,fn
/// in innermost-clause-first order. Then, if sE is a case clause, control is
/// transferred to the case clause. Otherwise, sE is necessarily a loop and
/// execution resumes after the last statement in the loop body.
/// @description Checks that a 'continue L;' statement inside a finally clause
/// transfers control to the innermost enclosing loop statement with label L
/// after the last statement in the loop body.
/// @author rodionov
/// @reviewer iefremov

import '../../../Utils/expect.dart';

main() {
  List order = [];

  L:
  for (int i in [1,2,3]) {
    try {
      throw 1;
    } on int catch (ok) {
    } finally {
      order.add(i);
      continue L;
      Expect.fail("This code shouldn't be executed");
    }
    Expect.fail("This code shouldn't be executed");
  }

  Expect.listEquals([1, 2, 3], order);
}

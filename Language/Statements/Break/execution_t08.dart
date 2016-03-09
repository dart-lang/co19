/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let s1, ..., sn be those try statements that are both enclosed in
 * sE and that enclose sb, and that have a finally clause. Lastly, let fj be the
 * finally clause of sj, 1 <= j <= n. Executing sb first executes f1, ..., fn
 * in innermost-clause-first order and then terminates sE.
 * @description Checks that the execution of "break;" statement terminates
 * the innermost enclosing loop or switch statement and that all finally
 * clauses between them are executed in the innermost-clause-first order.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  List order = new List();

  while (true) {
    try {
      try {
        break;
      } finally {
        order.add(2);
      }
    } finally {
      order.add(1);
    }
  }

  Expect.listEquals([2, 1], order);
}

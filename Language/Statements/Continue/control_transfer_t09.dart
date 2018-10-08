/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let s1,...,sn be those try statements that are both enclosed in
 * sE and that enclose sc, and that have a finally clause. Lastly, let fj be
 * the finally clause of sj, 1 <= j <= n. Executing sc first executes f1,...,fn
 * in innermost-clause-first order. Then, if sE is a case clause, control is
 * transferred to the case clause. Otherwise, sE is necessarily a loop and
 * execution resumes after the last statement in the loop body.

 * @description Checks that the execution of "continue L;" statement transfers
 * control to the innermost enclosing asynchronous for-in statement with the
 * appropriate label and that all finally clauses between them are executed
 * in the innermost-clause-first order.
 *
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';
import 'stream_utils.dart' as StreamUtils;

test() async {
  List log = new List();
  int i = 0;

  L:
  await for (String s in StreamUtils.makeStream(['a', 'b'])) {
    try {
      try {
        try {
          log.add(s);
          continue L;
          log.add("The code after continue should not be executed");
        } finally {
          log.add(i++);
        }
        log.add("The code after continue should not be executed");
      } finally {
        log.add(i++);
      }
      log.add("The code after continue should not be executed");
    } finally {
      log.add(i++);
    }
    log.add("The code after continue should not be executed");
  };

  Expect.listEquals(['a', 0, 1, 2, 'b', 3, 4, 5], log);
}

main() {
    asyncStart();
    test().then((_) => asyncEnd());
}
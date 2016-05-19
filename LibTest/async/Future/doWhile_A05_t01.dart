/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(dynamic f())
 * Perform an async operation repeatedly until it returns false.
 * . . .
 * Otherwise it waits for the returned Future to complete.
 *
 * @description Checks that if f returns not completes future it waits for
 * the returned Future to complete.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

const N = 4;
List<Completer> completers = new List<Completer>(N);
List<Future> futures = new List<Future>(N);

ontimeout() {
  return null;
}

main() {
  int num = 0;

  // Initializatin of Lists
  for (int k = 0; k < N; k++) {
    completers[k] = new Completer();
    futures[k] = completers[k].future;
  }

  Future ff() {
    if (num == 2) {
      num++;
      // refurn not completed future
      return futures[2];
    }
    if (num < N) {
      completers[num].complete(true);
      // return future completed with frue
      return futures[num++];
    } else {
      Completer c = new Completer();
      c.complete(false);
      // return future completed with false
      return c.future;
    }
  }

  Future f = Future.doWhile(ff);

  asyncMultiStart(2);
  f.then((fValue) {
    Expect.equals(4, num);
    asyncEnd();
  })
  .catchError((e) {
    Expect.fail("Should not be here: error $e");
    asyncEnd();
  });

  // Start timeout to complete not completed futures[2]
  Future f1 = futures[2].timeout(new Duration(milliseconds:1),
      onTimeout: ontimeout);

  f1.then((fValue) {
    Expect.equals(null, fValue);
    Expect.equals(3, num);
    // complete not commpleted future with true
    completers[2].complete(true);
    asyncEnd();
  });
}

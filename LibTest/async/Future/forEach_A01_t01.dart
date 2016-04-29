/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, Future f(element))
 * Perform an async operation for each element of the iterable, in turn.
 * Runs f for each element in input in order, moving to the next element
 * only when the Future returned by f completes.
 * @description Checks that async operations for each element of the iterable
 * are executed in turn.
 * @author kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

List input = [0,1,2,3,4];
int N = input.length;

main() {
  List<Completer> completers = new List<Completer>(N);
  List<bool> completerTrace = new List<bool>(N);
  List<bool> operationTrace = new List<bool>(N);

  for (int k = 0; k < N; k++) {
    completerTrace[k] = operationTrace[k] = false;
    completers[k] = new Completer();
  }

  Future ff(int element) {
    // check that previous future is completed
    if (element > 1) {
       Expect.isTrue(completerTrace[element - 1]);
    }
    // check that next element is not yet processed
    if (element + 1 < N) {
       Expect.isFalse(operationTrace[element + 1]);
    }
    operationTrace[element] = true;
    return completers[element].future;
  }

  Future f = Future.forEach(input, ff);

  asyncStart();
  bool visited = false;
  f.then((fValue) {
    visited = true;
    asyncEnd();
  });

  runLater(() {
    // make sure future f is not completed
    Expect.isFalse(visited);

    // complete the futures in reverse order
    for (int k = N - 1; k >= 0; k--) {
      completers[k].complete(k);
      completerTrace[k] = true;
    }
  });
}


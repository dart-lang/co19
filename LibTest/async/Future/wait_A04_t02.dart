/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List> wait(Iterable<Future> futures,
 *                {bool eagerError: false, void cleanUp(successValue)})
 * If cleanUp is provided, in the case of an error, any non-null result of a
 * successful future is passed to cleanUp, which can then release any resources
 * that the successful operation allocated.
 * @description Checks if cleanUp is provided, in the case of an error, any
 * non-null result of a successful future is passed to cleanUp (case when
 * eagerError: true).
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const N = 5;

main() {
  List<Completer> completers = new List<Completer>(N);
  for (int k = 0; k < N; k++) {
    completers[k] = new Completer();
  }
  List<Future> futures = new List<Future>(N);
  for (int k = 0; k < N; k++) {
    futures[k] = completers[k].future;
  }

  List<bool> sucValues = [true, false, false, true, true];

  void check(successValue) {
    Expect.isTrue(sucValues[successValue]);
    sucValues[successValue] = false;
    if (successValue == N - 1) {
      Expect.listEquals([false, false, false, false, false], sucValues);
    }
   // print("$successValue $sucValues");
  }

  Future f = Future.wait(futures, eagerError: true, cleanUp: check);

  asyncStart();
  f.then(
      (value) {
        Expect.fail("Should not be here");
        asyncEnd();
      },
      onError: (Object err) {
        Expect.isTrue(completers[0].isCompleted);
        Expect.isTrue(completers[1].isCompleted);
        Expect.isFalse(completers[2].isCompleted);
        Expect.isFalse(completers[3].isCompleted);
        Expect.isFalse(completers[4].isCompleted);
        completers[2].completeError(2);
        completers[3].complete(3);
        completers[4].complete(4);
        asyncEnd();
      }
  );

  completers[0].complete(0);
  completers[1].completeError(1);

}

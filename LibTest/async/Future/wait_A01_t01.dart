/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List> wait(Iterable<Future> futures,
 *                {bool eagerError: false, void cleanUp(successValue)})
 * Wait for all the given futures to complete and collect their values.
 * Returns a future which will complete once all the futures in a list are
 * complete.
 * @description Checks that the returned future is completed when all futures
 * in the list are completed.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List<Completer> completers = new List.generate(5, (_)=> new Completer());
  Iterable<Future> futures = completers.map((Completer c) => c.future);

  bool futureCompleted = false;
  asyncStart();
  Future.wait(futures).then(
    (value) {
      futureCompleted = true;
      List expected = new List.generate(completers.length, (i) => i);
      Expect.listEquals(expected, value);
      asyncEnd();
    }
  );

  int i = 0;
  new Timer.periodic(
      durationMs(50),
      (Timer t){
        Expect.isFalse(futureCompleted);
        completers[i].complete(i);
        if (++i == completers.length) {
          t.cancel();
        }
      }
  );
}

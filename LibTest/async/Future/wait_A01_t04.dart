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
 * @description Checks that the returned future is completed if all futures
 * from a list are completed before calling [wait].
 * @author msyabro
 * @reviewer iefremov
 */
import "dart:async";
import "../../../Utils/expect.dart";

const N = 5;

main() {
  List<Completer> completers = new List.generate(5, (_)=> new Completer());
  Iterable<Future> futures = completers.map((Completer c) => c.future);
  int i = 0;
  completers.forEach((Completer c) => c.complete(i++));

  asyncStart();
  Future.wait(futures)
    .then((value) {
      List expected = new List.generate(completers.length, (i) => i);
      Expect.listEquals(expected, value);
      asyncEnd();
    });
}

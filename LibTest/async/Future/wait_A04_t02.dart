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
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List<Completer> completers = new List.generate(5, (_) => new Completer());
  Iterable<Future> futures = completers.map((Completer c) => c.future);
  List successful = [];

  asyncStart();
  Future.wait(futures, eagerError: true, cleanUp: (v) => successful.add(v))
    .then(
      (_) {
        Expect.fail("Returned future should complete with error");
      },
      onError: (Object error) {
        Expect.equals(1, error);
        Expect.isTrue(completers[0].isCompleted);
        Expect.isTrue(completers[1].isCompleted);
        Expect.isFalse(completers[4].isCompleted);
        Expect.listEquals([0], successful);
        asyncEnd();
      }
    );

  completers[0].complete(0);
  completers[1].completeError(1);
  completers[2].completeError(2);
  completers[3].complete(3);
}

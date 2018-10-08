/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List> wait(Iterable<Future> futures,
 *                {bool eagerError: false, void cleanUp(successValue)})
 * If eagerError is true, the future completes with an error immediately on
 * the first error from one of the futures. Otherwise all futures must complete
 * before the returned future is completed (still with the first error to occur,
 * the remaining errors are silently dropped).
 * @description Checks if eagerError is true, the future completes with an error
 * immediately on the first error from one of the futures.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var completer1 = new Completer();
  var completer2 = new Completer();
  var completer3 = new Completer();
  var completer4 = new Completer();
  var completer5 = new Completer();

  var future1 = completer1.future;
  var future2 = completer2.future;
  var future3 = completer3.future;
  var future4 = completer4.future;
  var future5 = completer5.future;

  var f = Future.wait(
      [future1, future2, future3, future4, future5],
      eagerError: true
  );

  asyncStart();
  f.then(
      (value) {
        Expect.fail("Returned future should complete with error");
        asyncEnd();
      },
      onError: (Object error) {
        Expect.equals(2, error);
        Expect.isTrue(completer1.isCompleted);
        Expect.isTrue(completer2.isCompleted);
        Expect.isFalse(completer3.isCompleted);
        Expect.isFalse(completer4.isCompleted);
        Expect.isFalse(completer5.isCompleted);
        completer3.complete(3);
        completer4.complete(4);
        completer5.complete(5);
        asyncEnd();
      }
  );

  completer1.complete(1);
  completer2.completeError(2);
}

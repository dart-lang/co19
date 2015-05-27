/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<List> wait(Iterable<Future> futures)
 * If any of the futures in the list completes with an error, the resulting future
 * also completes with an error.
 * Otherwise the value of the returned future will be a list of all the values that were produced.
 * @description Checks that the returned future is completed when a single future in the list
 * is completed with exception.
 * @author iefremov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
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

  var f = Future.wait([future1, future2, future3, future4, future5]);

  asyncStart();
  f.catchError((value) {
    Expect.isTrue(completer1.isCompleted);
    asyncEnd();
  });

  completer1.completeError(1);
  completer2.complete(2);
  completer3.complete(3);
  completer4.complete(4);
  completer5.complete(5);
}

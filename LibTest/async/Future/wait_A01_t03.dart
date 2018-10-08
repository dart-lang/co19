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
 * @description Checks that the value of the returned future is a list of all
 * values that were produced.
 * @author msyabro
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

  asyncStart();
  Future.wait([future1, future2, future3, future4, future5])
    .then((value) {
      Expect.listEquals([1, 2, 3, 4, 5], value);
      asyncEnd();
    });

  completer1.complete(1);
  completer2.complete(2);
  completer3.complete(3);
  completer4.complete(4);
  completer5.complete(5);
}

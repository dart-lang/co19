/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future wait(List futures)
 * Returns a future which will complete once all the futures in a list are complete.
 * (The value of the returned future will be a list of all the values that were produced.)
 * @description Checks that the returned future is completed when all futures in the list
 * are completed with exception.
 * @author msyabro
 * @needsreview behaviour is not specified, issue 1930
 */

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

  var f = Futures.wait([future1, future2, future3, future4, future5]);

  bool visited = false;
  f.then((value) {
    Expect.isTrue(future1.isComplete);
    Expect.isTrue(future2.isComplete);
    Expect.isTrue(future3.isComplete);
    Expect.isTrue(future4.isComplete);
    Expect.isTrue(future5.isComplete);
    visited = true;
  });

  completer1.completeException(1);
  completer2.completeException(2);
  completer3.completeException(3);
  completer4.completeException(4);
  completer5.completeException(5);

  Expect.isTrue(visited);
}
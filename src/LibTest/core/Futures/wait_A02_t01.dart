/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If any of the futures in the list completes with an exception,
 * the resulting future also completes with an exception
 * @description Checks that the returned future is completed when one of the futures in the list
 * is completed with exception.
 * @author iefremov
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

  future1.handleException((e) => true);
  future2.handleException((e) => true);
  future3.handleException((e) => true);
  future4.handleException((e) => true);

  var f = Futures.wait([future1, future2, future3, future4, future5]);

  bool visited = false;
  f.handleException((value) {
    Expect.isTrue(future5.isComplete);
    visited = true;
  });

  completer1.completeException(1);
  completer2.completeException(2);
  completer3.completeException(3);
  completer4.completeException(4);
  completer5.completeException(5);

  Expect.isTrue(visited, "Exception handler was not called!");
  Expect.isTrue(f.isComplete, "The future should be completed!");
  Expect.isTrue(f.exception != null, "The future should complete with an exception!");
}
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future wait(List futures)
 * Returns a future which will complete once all the futures in a list are complete.
 * (The value of the returned future will be a list of all the values that were produced.)
 * @description Checks that the returned future is completed if all futures from a list
 * are completed before calling [wait].
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  var future1 = new Future.immediate(1);
  var future2 = new Future.immediate(2);
  var future3 = new Future.immediate(3);
  var future4 = new Future.immediate(4);
  var future5 = new Future.immediate(5);

  var f = Futures.wait([future1, future2, future3, future4, future5]);

  bool visited = false;
  f.then((value) {
    Expect.isTrue(future1.isComplete);
    Expect.isTrue(future2.isComplete);
    Expect.isTrue(future3.isComplete);
    Expect.isTrue(future4.isComplete);
    Expect.isTrue(future5.isComplete);

    Expect.listEquals([1, 2, 3, 4, 5], value);

    visited = true;
  });

  Expect.isTrue(visited);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future wait(List futures)
 * Returns a future which will complete once all the futures in a list are complete.
 * (The value of the returned future will be a list of all the values that were produced.)
 * @description Checks that the returned future has the correct value if
 * a list contains only one element.
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  var completer = new Completer();
  var future = completer.future;

  var f = Futures.wait([future]);

  bool visited = false;
  f.then((value) {
    Expect.isTrue(future.isComplete);

    Expect.listEquals([1], value);

    visited = true;
  });

  completer.complete(1);

  Expect.isTrue(visited);
}
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
 * a list is empty.
 * @author msyabro
 */

main() {
  var f = Futures.wait([]);

  bool visited = false;
  f.then((value) {
    Expect.listEquals([], value);
    visited = true;
  });

  Expect.isTrue(visited);
}
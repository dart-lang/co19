/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<List> wait(Iterable<Future> futures)
 * Wait for all the given futures to complete and collect their values.
 * Returns a future which will complete once all the futures in a list are complete.
 * @description Checks that the returned future has the correct value if
 * a list is empty.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var f = Future.wait([]);

  bool visited = false;
  f.then((value) {
    Expect.listEquals([], value);
    visited = true;
  });

  new Future.delayed(0, (){
    Expect.isTrue(visited);
  });
}

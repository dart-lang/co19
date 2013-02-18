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
 * a list contains only one element.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;

  var f = Future.wait([future]);

  bool visited = false;
  f.then((value) {
    visited = true;
    Expect.listEquals([1], value);
  });

  completer.complete(1);

  new Future.delayed(0, (){
    Expect.isTrue(visited);
  });
}

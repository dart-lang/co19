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
 * @description Checks that the returned future completes with correct value
 * if futures in a list are chained.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

inc(x) => x + 1;

main() {
  var f1 = new Future.delayed(new Duration(milliseconds: 100), () => 1);
  var f2 = f1.then(inc);
  var f3 = f2.then(inc);
  var f4 = f3.then(inc);
  var f5 = f4.then(inc);

  asyncStart();
  Future.wait([f5, f4, f3, f2, f1]).then((value) {
    Expect.listEquals([5, 4, 3, 2, 1], value);
    asyncEnd();
  });
}

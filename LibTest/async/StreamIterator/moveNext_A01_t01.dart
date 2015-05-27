/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future<bool> moveNext()
 * Wait for the next stream value to be available.
 * It is not allowed to call this function again until the future has completed.
 * If the returned future completes with anything except true, the iterator is done,
 * and no new value will ever be available.
 * The future may complete with an error, if the stream produces an error.
 * @description Checks that futures returned by moveNext() complete with
 * expected true and false values.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var si = new StreamIterator(new Stream.fromIterable([1,2,3,4,5]));
  var count = 1;

  f() {
    si.moveNext().then((value) {
      if (count < 6) {
        Expect.identical(true, value);
        Expect.identical(count++, si.current);
        f();
      } else {
        Expect.identical(false, value);
        asyncEnd();
      }
    });
  }

  asyncStart();

  f();
}

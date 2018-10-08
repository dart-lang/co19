/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> moveNext()
 * Wait for the next stream value to be available.
 *
 * Returns a future which will complete with either true or false. Completing
 * with true means that another event has been received and can be read as
 * current. Completing with false means that the stream itearation is done and
 * no further events will ever be available. The future may complete with an
 * error, if the stream produces an error, which also ends iteration.
 *
 * The function must not be called again until the future returned by a previous
 * call is completed.
 *
 * @description Checks that futures returned by moveNext() complete with
 * expected true and false values.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var si = new StreamIterator(new Stream.fromIterable([1, 2, 3, 4, 5]));
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

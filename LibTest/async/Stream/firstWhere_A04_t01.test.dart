// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> firstWhere (bool test(T element), T orElse()})
///
/// Finds the first element of this stream matching test.
///
/// Returns a future that is completed with the first element of this stream for
/// which test returns true.
///
/// If no such element is found before this stream is done, and an orElse
/// function is provided, the result of calling orElse becomes the value of the
/// future. If orElse throws, the returned future is completed with that error.
///
/// If this stream emits an error before the first matching element, the
/// returned future is completed with that error, and processing stops.
///
/// Stops listening to this stream after the first matching element or error has
/// been received.
///
/// Internally the method cancels its subscription after the first element that
/// matches the predicate. This means that single-subscription (non-broadcast)
/// streams are closed and cannot be reused after a call to this method.
///
/// If an error occurs, or if this stream ends without finding a match and with
/// no orElse function provided, the returned future is completed with an error.
///
/// @description Checks that listening to this stream is stopped after the first
/// matching element received.
/// @author a.semenov@unipro.ru

library firstWhere_A04_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, int max) {
  int count = 0;
  s = s.map((event) {
    count++;
    if (count > max) {
      Expect.fail("Stream should be cancelled");
    }
    return event;
  });
  asyncStart();
  s.firstWhere((v) => v == 2).then((_) {
    Expect.equals(count, max);
    // Wait for some time to make sure that there is no more events
    Future.delayed(Duration(seconds: 1), () {
      Expect.equals(count, max);
      asyncEnd();
    });
  });
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3, 4, 5]), 2);
  check(create([0, 1, 2, 3, 4]), 3);
}

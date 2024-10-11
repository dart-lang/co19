// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> first
/// The first element of this stream.
///
/// Stops listening to this stream after the first element has been received.
///
/// Internally the method cancels its subscription after the first element. This
/// means that single-subscription (non-broadcast) streams are closed and cannot
/// be reused after a call to this getter.
///
/// If an error event occurs before the first data event, the returned future is
/// completed with that error.
///
/// If this stream is empty (a done event occurs before the first data event),
/// the returned future completes with an error.
///
/// Except for the type of the error, this method is equivalent to
/// [this.elementAt(0)].
///
/// @description Checks that non broadcast stream can not be listened after
/// the first element is returned.
/// @author a.semenov@unipro.ru

library first_A04_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s) {
  int count = 0;
  s = s.map((event) {
    count++;
    if (count > 1) {
      Expect.fail("Stream should be cancelled");
    }
    return event;
  });
  asyncStart();
  s.first.then((v) {
    Expect.equals(1, count);
    // Wait for some time to make sure that there are no more events
    Future.delayed(Duration(seconds: 1), () {
      Expect.equals(1, count);
      asyncEnd();
    });
  });
}

void test(CreateStreamFunction create) {
  check(create([123]));
  check(create([1, 2, 3]));
}

// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<bool> get isEmpty
/// Whether this stream contains any elements.
///
/// Waits for the first element of this stream, then completes the returned
/// future with `false`. If this stream ends without emitting any elements, the
/// returned future is completed with `true`.
///
/// If the first event is an error, the returned future is completed with that
/// error.
///
/// This operation listens to this stream, and a non-broadcast stream cannot be
/// reused after checking whether it is empty.
///
/// @description Checks that stream subscription is canceled after checking
/// whether the stream is empty.
/// @author a.semenov@unipro.ru

library isEmpty_A04_t01;

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
  s.isEmpty.then((bool actual) {
    Expect.equals(count, max);
    // Wait for some time to make sure that there is no more events
    Future.delayed(Duration(seconds: 1), () {
      Expect.equals(count, max);
      asyncEnd();
    });
  });
}

void test(CreateStreamFunction create) {
  check(create([]), 0);
  check(create([1, 2, 3, null]), 1);
  check(create(new Iterable.generate(0, (int index) => 1)), 0);
  check(create(new Iterable.generate(10, (int index) => 1)), 1);
}

// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> elementAt( int index )
/// Returns the value of the indexth data event of this stream.
///
/// Stops listening to this stream after the indexth data event has been
/// received.
///
/// Internally the method cancels its subscription after these elements. This
/// means that single-subscription (non-broadcast) streams are closed and cannot
/// be reused after a call to this method.
///
/// If an error event occurs before the value is found, the future completes
/// with this error.
///
/// If a done event occurs before the value is found, the future completes with
/// a [RangeError].
///
/// @description Checks that after the indexth data event has been received
/// listening to this stream is stopped.
/// @author a.semenov@unipro.ru

library elementAt_A01_t02;

import "dart:async";
import "../../../Utils/expect.dart";

const index = 4;

void test(CreateStreamFunction create) {
  int count = -1;
  Stream<int> s = create([0, 1, 2, 3, 4, 5, 6, 7, 8]);
  s = s.map((event) {
    count++;
    if (count > index) {
      Expect.fail("Stream should be cancelled");
    }
    return event;
  });
  asyncStart();
  s.elementAt(index).then((int t) {
    Expect.equals(index, count);
    // Wait for some time to make sure that there are no more events
    Future.delayed(Duration(seconds: 1), () {
      Expect.equals(index, count);
      asyncEnd();
    });
  });
}

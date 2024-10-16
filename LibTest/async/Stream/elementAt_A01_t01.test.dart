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
/// @description Checks that the future returns the value of the indexth data
/// event of this stream.
/// @author kaigorodov

library elementAt_A01_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(123, create([123]).elementAt(0));
  AsyncExpect.value(123, create([1, 123, 2, 3]).elementAt(1));
  for (int k = 0; k < 10; k++) {
    Stream<int> s =
        create(new Iterable<int>.generate(10, (int index) => index));
    AsyncExpect.value(k, s.elementAt(k));
  }
}

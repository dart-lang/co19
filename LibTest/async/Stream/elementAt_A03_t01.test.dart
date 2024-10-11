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
/// @description Checks that if a done event occurs before the value is found,
/// the future completes with a RangeError.
/// @author kaigorodov

library elementAt_A03_t01;

import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.error((e) => e is RangeError, create([]).elementAt(1));
  for (int k = 1; k < 10; k++) {
    Iterable<int> it = new Iterable<int>.generate(k - 1, (int index) => index);
    AsyncExpect.error((e) => e is RangeError, create(it).elementAt(k));
  }
}

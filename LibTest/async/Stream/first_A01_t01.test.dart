// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> get first
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
/// @description Checks that the first element is returned.
/// @author kaigorodov

library first_A01_t01;

import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(123, create([123]).first);
  AsyncExpect.value(1, create([1, 2, 3]).first);
}

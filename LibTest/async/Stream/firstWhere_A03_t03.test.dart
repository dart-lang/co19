/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> firstWhere (
 *  bool test(T element), {@deprecated dynamic defaultValue(), T orElse()})
 *
 * Finds the first element of this stream matching test.
 *
 * Returns a future that is completed with the first element of this stream that
 * test returns true for.
 *
 * If no such element is found before this stream is done, and a orElse function
 * is provided, the result of calling orElse becomes the value of the future. If
 * orElse throws, the returned future is completed with that error.
 *
 * If this stream emits an error before the first matching element, the returned
 * future is completed with that error, and processing stops.
 *
 * Stops listening to the stream after the first matching element or error has
 * been received.
 *
 * Internally the method cancels its subscription after the first element that
 * matches the predicate. This means that single-subscription (non-broadcast)
 * streams are closed and cannot be reused after a call to this method.
 *
 * If an error occurs, or if this stream ends without finding a match and with
 * no orElse function provided, the returned future is completed with an error.
 *
 * The defaultValue parameter is deprecated, and orElse should be used instead.
 * @description Checks that if an [test] throws error,  the future
 * will be completed with that error.
 * @author kaigorodov
 */
library firstWhere_A03_t03;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Error expected = new Error();
  Stream s = create([1,2,3,4,5]);
  AsyncExpect.error(expected, s.firstWhere((v) => throw expected));
}

// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> firstWhere (
///  bool test(T element), {@deprecated dynamic defaultValue(), T orElse()})
///
/// Finds the first element of this stream matching test.
///
/// Returns a future that is completed with the first element of this stream that
/// test returns true for.
///
/// If no such element is found before this stream is done, and a orElse function
/// is provided, the result of calling orElse becomes the value of the future. If
/// orElse throws, the returned future is completed with that error.
///
/// If this stream emits an error before the first matching element, the returned
/// future is completed with that error, and processing stops.
///
/// Stops listening to the stream after the first matching element or error has
/// been received.
///
/// Internally the method cancels its subscription after the first element that
/// matches the predicate. This means that single-subscription (non-broadcast)
/// streams are closed and cannot be reused after a call to this method.
///
/// If an error occurs, or if this stream ends without finding a match and with
/// no orElse function provided, the returned future is completed with an error.
///
/// The defaultValue parameter is deprecated, and orElse should be used instead.
/// @description Checks that if this stream ends without finding a match and with
/// no orElse function provided, the future will receive an error.
/// @author kaigorodov

library firstWhere_A03_t02;

import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream<int?> s, bool test(int? element)) {
  AsyncExpect.error((e) => e is Error, s.firstWhere(test));
}

void test(CreateStreamFunction create) {
  check(create([]), (int? element) => true);
  check(create([1, 2, 3]), (int? element) => element == null);
  check(create<int?>([null, null]), (int? element) => element != null);
  check(create(new Iterable.generate(0, (int index) => index)),
      (int? element) => false);
  check(create(new Iterable.generate(10, (int index) => index)),
      (int? element) => false);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int? element) => element! < 0);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int? element) => element == 300);
}

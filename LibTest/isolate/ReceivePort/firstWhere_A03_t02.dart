// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> firstWhere(bool test(T element), {T orElse()?})
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
/// @description Checks that if this stream ends without finding a match and
/// with no [orElse] function provided, the future will receive an error.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable data, bool test(var element)) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  s.firstWhere(test).then((data) {
    Expect.fail("data passed: $data");
  }, onError: (error) {
    Expect.isTrue(error is Error);
    asyncEnd();
  });
}

main() {
  check([], (var element) => true);
  check([1, 2, 3], (var element) => element == null);
  check([null, null], (var element) => element != null);
  check(new Iterable.generate(0, (int index) => index), (var element) => false);
  check(
      new Iterable.generate(10, (int index) => index), (var element) => false);
  check(new Iterable.generate(10, (int index) => index * 5),
      (var element) => element < 0);
  check(new Iterable.generate(10, (int index) => index * 5),
      (var element) => element == 300);
}

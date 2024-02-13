// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> lastWhere(bool test(T element), {T orElse()?})
///
/// Finds the last element in this stream matching test.
///
/// Returns a future that is completed with the last element of this stream for
/// which test returns true.
///
/// If no such element is found before this stream is done, and an orElse
/// function is provided, the result of calling orElse becomes the value of the
/// future. If orElse throws, the returned future is completed with that error.
///
/// If this stream emits an error at any point, the returned future is completed
/// with that error, and the subscription is canceled.
///
/// A non-error result cannot be provided before this stream is done.
///
/// Similar too firstWhere, except that the last matching element is found
/// instead of the first.
///
/// @description Checks that if element is found, it is passed to the resulting
/// future.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

void check1(Iterable data, bool test(element), var expected) {
  Stream s = new Stream.fromIterable(data);
  asyncStart();
  Future f = s.lastWhere(test);
  f.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check2(Iterable data, bool test(element), var expected) {
  Stream s = new Stream.fromIterable(data);
  asyncStart();
  Future f = s.lastWhere(test, orElse: () {
    Expect.fail("should not be called");
  });
  f.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check(Iterable data, bool test(element), var expected) {
  check1(data, test, expected);
  check2(data, test, expected);
}

main() {
  check([1, 2, 3], (element) => true, 3);
  check([1, 2, 3], (element) => element != null, 3);
  check([1, 2, 3, null], (element) => element == null, null);
  check([1, 2, 3], (element) => element > 0, 3);
  check(new Iterable.generate(10, (int index) => index * 5),
      (element) => element != 30, 45);
  check(new Iterable.generate(10, (int index) => index * 5),
      (element) => element == 30, 30);
}

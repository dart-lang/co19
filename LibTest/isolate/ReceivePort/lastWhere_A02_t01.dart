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
/// @description Checks that if this stream ends without finding a match and an
/// [orElse] function is provided, the result of calling [orElse] becomes the
/// value of the future.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable data, bool test(element), int expected) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  Future f = s.lastWhere(test, orElse: () => expected);
  f.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (element) => true, 1);
  check([1, 2, 3], (element) => element == null, 0);
  check(Iterable.generate(0, (int index) => index), (element) => false, 0);
  check(Iterable.generate(0, (int index) => index), (element) => true, 0);
  check(Iterable.generate(10, (int index) => index), (element) => false, 22);
  check(Iterable.generate(10, (int index) => index * 5),
          (element) => element < 0, 33);
}

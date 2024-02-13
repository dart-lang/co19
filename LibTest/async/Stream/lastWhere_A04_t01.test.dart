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
/// @description Checks that if this stream ends without finding a match and
/// no [orElse] function provided, the future will receive an error.
/// @author kaigorodov

library lastWhere_A04_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element)) {
  AsyncExpect.error((e) => e is Error, s.lastWhere(test));
}

void test(CreateStreamFunction create) {
  check(create([]), (element) => true);
  check(create([1, 2, 3]), (int? element) => element == null);
  check<int?>(create([null, null]), (int? element) => element != null);
  check(create(new Iterable.generate(0, (int index) => index)),
      (int element) => false);
  check(create(new Iterable.generate(10, (int index) => index)),
      (int element) => false);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element < 0);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 300);
}

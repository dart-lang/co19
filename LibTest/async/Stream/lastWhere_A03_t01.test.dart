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
/// @description Checks that if an error occurs in the stream, the future will
/// receive that error.
/// @author kaigorodov
/// @author a.semenov@unipro.ru

library lastWhere_A03_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), Object expectedError) {
  AsyncExpect.error(expectedError, s.lastWhere(test));
}

void test(CreateStreamWithErrorsFunction create) {
  check<int>(create([1, 2, 3], isError: (e) => true, defaultValue: 42),
      (x) => x > 0, 1);
  check<int>(create([1, 2, 3], isError: (e) => e == 3, defaultValue: 42),
      (x) => x > 0, 3);
  check<int>(
      create([-1, 1, -2, 2, 3], isError: (e) => e == 3, defaultValue: 42),
      (x) => x < 0,
      3);
}

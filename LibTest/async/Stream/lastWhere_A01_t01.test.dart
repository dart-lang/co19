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
/// future. [orElse] is omitted.
/// @author a.semenov@unipro.ru

library lastWhere_A01_t01;

import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(3, create([1, 2, 3]).lastWhere((element) => true));
  AsyncExpect.value(
      3, create([1, 2, 3]).lastWhere((int? element) => element != null));
  AsyncExpect.value(null, create([1, 2, 3, null]).lastWhere((e) => e == null));
  AsyncExpect.value(3, create([1, 2, 3]).lastWhere((element) => element > 0));
  AsyncExpect.value(
      45,
      create(new Iterable.generate(10, (int index) => index * 5))
          .lastWhere((int element) => element != 30));
  AsyncExpect.value(
      30,
      create(new Iterable.generate(10, (int index) => index * 5))
          .lastWhere((int element) => element == 30));
}

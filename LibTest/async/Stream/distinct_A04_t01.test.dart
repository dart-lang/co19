// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<T> distinct([bool equals(T previous, T next)])
/// Skips data events if they are equal to the previous data event.
/// The returned stream provides the same events as this stream, except that it
/// never provides two consecutive data events that are equal.
/// @description Checks that errors in original stream are copied to the
/// returned stream. [equals] is omitted.
/// @issue 29627
/// @author a.semenov@unipro.ru

library distinct_A04_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expectedData, List expectedErrors) {
  AsyncExpect.events(expectedData, expectedErrors, s.distinct());
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([], defaultValue: 0), [], []);
  check<int>(create([1, 2, 2, 3], isError: (e) => e.isEven, defaultValue: 42),
      [1, 3], [2, 2]);
  check<int>(
      create([1, 1, 2, 2, 3, 3], isError: (e) => e.isEven, defaultValue: 42),
      [1, 3],
      [2, 2]);
  check<int>(
      create([1, 1, 2, 2, 3, 3], isError: (e) => e.isOdd, defaultValue: 42),
      [2],
      [1, 1, 3, 3]);
  check<int?>(
      create([1, 2, null, null], isError: (e) => e is num, defaultValue: 42),
      [null],
      [1, 2]);
}

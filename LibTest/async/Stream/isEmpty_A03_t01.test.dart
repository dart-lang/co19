// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<bool> get isEmpty
/// Whether this stream contains any elements.
///
/// Waits for the first element of this stream, then completes the returned
/// future with `false`. If this stream ends without emitting any elements, the
/// returned future is completed with `true`.
///
/// If the first event is an error, the returned future is completed with that
/// error.
///
/// This operation listens to this stream, and a non-broadcast stream cannot be
/// reused after checking whether it is empty.
///
/// @description Checks that returned future is completed with the first error,
/// that appears in the stream
/// @issue 29730
/// @author a.semenov@unipro.ru

library isEmpty_A03_t01;

import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  AsyncExpect.value(true, create([], defaultValue: 42).isEmpty);
  AsyncExpect.error(
      1,
      create([1, 2, 3, null], isError: (x) => x == 1, defaultValue: 42)
          .isEmpty);
  AsyncExpect.value(
      false,
      create([1, 2, 3, null], isError: (x) => x == 3, defaultValue: 42)
          .isEmpty);
}

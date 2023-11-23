// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static Future<void> asyncThrows(Future<void> func(),
///       [_CheckExceptionFn? check, String reason = '']) async {
/// Descriptive error message is provided in case of failure.
///
/// @description Checks that if function `check` returns `false` then
/// `asyncThrows` fails
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class TestException implements Exception {}

test(Future<void> func(), bool check(exception)) async {
  bool thrown = false;
  try {
    await Expect.asyncThrows(func, check);
  } catch (_) {
    thrown = true;
  }
  Expect.isTrue(thrown);
}

main() async {
  test(() async {
    throw Exception();
  }, (e) => e is TestException);

  await test(() async {
    throw Exception();
  }, (e) => e is TestException);

  test(() { // not async
    throw Exception(42);
  }, (e) => e is TestException);

  await test(() { // not async
    throw Exception(42);
  }, (e) => e is TestException);
}

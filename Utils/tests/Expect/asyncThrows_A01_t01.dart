// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static Future<void> asyncThrows(Future<void> func(),
///       [_CheckExceptionFn? check, String reason = '']) async {
/// Descriptive error message is provided in case of failure.
///
/// @description Checks that `asyncThrows` catches exceptions thrown by async
/// functions
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class TestException implements Exception {}

main() {
  Expect.asyncThrows(() async {
    throw Exception(42);
  });

  Expect.asyncThrows(() async {
    if (2 > 1) {
      throw Exception(42);
    }
    return;
  });

  Expect.asyncThrows(() async {
    throw TestException();
  }, (e) => e is TestException, "Message");

  Expect.asyncThrows(() { // not async
    throw Exception(42);
  });
}

// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static Future<void> asyncThrows(Future<void> func(),
///       [_CheckExceptionFn? check, String reason = '']) async {
/// Descriptive error message is provided in case of failure.
///
/// @description Checks that of `func` doesn't throw an exception then
/// `asyncThrows` fails
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

check(Future<void> func()) async {
  bool thrown = false;
  try {
    await Expect.asyncThrows(func);
  } catch (_) {
    thrown = true;
  }
  Expect.isTrue(thrown);
}

main() async {
  check(() async {
    print(42);
  });

  check(() async {
    if (2 > 1) {
      print(42);
    }
    return;
  });

  check(() { // not async
    return Future<void>.value(42);
  });

  await check(() async {
    print(42);
  });

  await check(() async {
    if (2 > 1) {
      print(42);
    }
    return;
  });

  await check(() { // not async
    return Future<void>.value(42);
  });
}

// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void handleUncaughtError(error, StackTrace stackTrace)
///  Handles uncaught asynchronous errors.
/// @description Checks that zone's error callback is invoked.
/// @author ilya


import "dart:async";
import "../../../Utils/expect.dart";

var error = 1;
var stackTrace;

void test() {
  try {
    throw error;
  } catch (e,st) {
    stackTrace = st;
    Zone.current.handleUncaughtError(e, st);
  }
}

main() {
  runZonedGuarded(test, (e,st) {
    Expect.identical(error, e);
    Expect.identical(stackTrace, st);
  });
}

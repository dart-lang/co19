/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.sync(dynamic computation())
 * Creates a future containing the result of immediately calling computation.
 * If calling computation throws, the returned future is completed with the
 * error.
 * If calling computation returns a Future, completion of the created future
 * will wait until the returned future completes, and will then complete with
 * the same result.
 * If calling computation returns a non-future value, the returned future is
 * completed with that value.
 * @description Checks that computation() is done synchronously.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var x;
  new Future.sync(() => x = 1);
  Expect.equals(1, x);
}

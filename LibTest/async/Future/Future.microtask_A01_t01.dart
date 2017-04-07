/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.microtask(dynamic computation())
 *    Creates a future containing the result of calling computation
 * asynchronously with scheduleMicrotask.
 * @description Checks that computation() is run asynchronously.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var x;
  new Future.microtask(() => x = 1);
  Expect.isNull(x);
}

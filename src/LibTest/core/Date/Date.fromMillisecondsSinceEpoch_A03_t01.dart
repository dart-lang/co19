/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully when given an argument of a wrong type.
 * @description Checks that the method doesn't crash.
 * @author iefremov
 * @needsreview not documented
 */

main() {
  Expect.throws(() => new Date.fromMillisecondsSinceEpoch(3.14, true));
  Expect.throws(() => new Date.fromMillisecondsSinceEpoch("", true));
  Expect.throws(() => new Date.fromMillisecondsSinceEpoch(1, 3.14));
  Expect.throws(() => new Date.fromMillisecondsSinceEpoch(1, ""));
}

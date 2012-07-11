/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully when given an argument of a wrong type.
 * @description Checks that method doesn't crash.
 * @author iefremov
 * @static-warning
 */

main() {
  Expect.throws(() => new Date.now().add(1));
  Expect.throws(() => new Date.now().add(""));
  Expect.throws(() => new Date.now().add(3.14));
}

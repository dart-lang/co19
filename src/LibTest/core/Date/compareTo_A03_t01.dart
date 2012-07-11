/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully when given an argument of a wrong type.
 * @description Checks that the method does not crash.
 * @author iefremov
 * @needsreview undocumented
 */

main() {
  Expect.throws(() => new Date(2000, 1, 1, 0, 0, 0, 0).compareTo(1));
  Expect.throws(() => new Date(2000, 1, 1, 0, 0, 0, 0).compareTo(""));
  Expect.throws(() => new Date(2000, 1, 1, 0, 0, 0, 0).compareTo(3.14));
}

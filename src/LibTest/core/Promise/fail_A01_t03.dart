/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fail(var error)
 * Indicate that an error was found while computing this value.
 * @description Calls [: fail() :] on promise with provided value.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Behavior is not documented, assuming it is similar to that of [:complete:] (throws exception).
 */

tryFail(Promise p) {
  try {
    p.fail(-1);
    Expect.fail("Expected exception");
  } catch (var e) {}
}

main() {
  Promise p = new Promise();
  p.complete(7);
  tryFail(p);

  p = new Promise.fromValue(3);
  tryFail(p);
}


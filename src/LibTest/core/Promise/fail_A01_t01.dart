/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fail(var error)
 * Indicate that an error was found while computing this value.
 * @description Calls [: fail() :] twice. Expecting exception by analogy with [: complete :].
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Behavior is not specified. Expected exception (what type?).
 */

main() {
  Promise p = new Promise();
  p.fail(-1);

  try {
    p.fail(-2);
    Expect.fail("Expected exception");
  } catch (var e) {}
}


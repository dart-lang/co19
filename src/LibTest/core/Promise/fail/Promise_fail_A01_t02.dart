/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fail(var error)
 * Indicate that an error was found while computing this value.
 * @description Calls [: fail() :] after [: cancel() :]. 
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Behavior is not documented, assuming it is similar to that of [:complete:] (ignored).
 */

main() {
  Promise p = new Promise();
  p.cancel();
  p.fail(-1);
  Expect.isTrue(p.isCancelled());
  Expect.isFalse(p.hasError());
  Expect.equals(p.error, null);
}


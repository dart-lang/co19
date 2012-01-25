/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool cancel()
 * Cancel the asynchronous work of this promise, if possible.
 * @description Checks that calling [: cancel() :] on completed
 * promise is ignored and returns 'false'.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Described behavior is an assumption.
 */


check(val) {
  Promise p = new Promise();
  p.complete(val);
  Expect.isFalse(p.cancel());
  Expect.isFalse(p.isCancelled());

  p = new Promise.fromValue(val);
  Expect.isFalse(p.cancel());
  Expect.isFalse(p.isCancelled());
}

main() {
  check(12);
  check(null);
}


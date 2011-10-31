/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool cancel()
 * Cancel the asynchronous work of this promise, if possible.
 * @description Checks that calling [: cancel() :] on failed
 * promise is ignored and returns 'false'.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Described behavior is an assumption.
 */


main() {
  Promise p = new Promise();
  p.fail(-1);
  Expect.isFalse(p.cancel());
  Expect.isFalse(p.isCancelled());
}


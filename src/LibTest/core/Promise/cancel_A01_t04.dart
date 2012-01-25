/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool cancel()
 * Cancel the asynchronous work of this promise, if possible.
 * @description Checks that calling [: cancel() :] on cancelled
 * promise is ignored and returns 'false'.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Described behavior is an assumption.
 */


main() {
  Promise p = new Promise();
  Expect.isTrue(p.cancel());
  Expect.isTrue(p.isCancelled());

  Expect.isFalse(p.cancel());
  Expect.isTrue(p.isCancelled());

  p.complete(2);
  Expect.isFalse(p.cancel());
  Expect.isTrue(p.isCancelled());


  p = new Promise();
  p.cancel();
  p.fail(-1);
  Expect.isFalse(p.cancel());
  Expect.isTrue(p.isCancelled());
}


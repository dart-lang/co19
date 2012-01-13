/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool cancel()
 * Cancel the asynchronous work of this promise, if possible.
 * @description Simple check.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Assumed [: cancel() :] returns true if succeeds, false otherwise.
 */


main() {
  Promise p = new Promise();
  Expect.isTrue(p.cancel());
  Expect.isTrue(p.isCancelled());
}


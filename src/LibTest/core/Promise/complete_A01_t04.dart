/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete(T value)
 * Provide the computed value; throws an exception if a value has already been
 * provided or the promise previously completed with an error; ignored if the
 * promise was cancelled.
 * @description Checks that [: complete() :] does not change the value and the
 * state of a cancelled promise.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  Promise p = new Promise();
  p.cancel();
  Expect.equals(null, p.value);
  p.complete(3);
  Expect.equals(null, p.value);
  Expect.isTrue(p.isCancelled());
}


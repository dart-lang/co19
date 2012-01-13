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
 * @description Checks that [: complete() :] provides the computed value
 * @author msyabro
 * @reviewer kaigorodov
 */


check(var val) {
  Promise p = new Promise();
  p.complete(val);
  Expect.isTrue(p.isDone());
  Expect.isTrue(p.hasValue());
  Expect.isFalse(p.hasError());
  Expect.isFalse(p.isCancelled());
  Expect.equals(val, p.value);
}

main() {
  check(1);
  check(true);
  check((int x) => x + 1);
  check(null);
  check("String");
  check(new Object());
}


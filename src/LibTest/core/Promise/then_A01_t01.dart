/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Promise then(callback(T value))
 * When this promise completes, execute [callback]. The result of [callback]
 * will be exposed through the returned promise. This promise, and the
 * resulting promise (r) are connected as follows:
 *  - this.complete --> r.complete (with the result of [callback])
 *  - this.error    --> r.error (the same error is propagated to r)
 *  - this.cancel   --> r.error (the cancellation is shown as an error to r)
 *  - r.cancel      --> this continues executing regardless.
 * @description Simple checks on resulting promise.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  foo(val) { return val*val; }

  // this.complete --> r.complete (with the result of [callback])
  var p = new Promise();
  var pNext = p.then(foo);
  p.complete(3);
  Expect.isTrue(pNext.hasValue());
  Expect.equals(pNext.value, 9);

  // this.error    --> r.error (the same error is propagated to r)
  p = new Promise();
  pNext = p.then(foo);
  p.fail(-7);
  Expect.equals(pNext.error, p.error);

  // this.cancel   --> r.error (the cancellation is shown as an error to r)
  p = new Promise();
  pNext = p.then(foo);
  p.cancel();
  Expect.isFalse(pNext.isCancelled());
  Expect.isTrue(pNext.hasError());

  // r.cancel      --> this continues executing regardless.
  p = new Promise();
  pNext = p.then(foo);
  pNext.cancel();
  Expect.isFalse(p.isDone());
  Expect.isFalse(p.isCancelled());
  pNext = p.then(foo);
  p.complete(3);
  Expect.isTrue(pNext.hasValue());
  Expect.equals(pNext.value, 9);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future chain(Future transformation(value))
 * A future representing an asynchronous transformation applied to this
 * future's value. [transformation] must return a Future.
 * When this future gets a value, [transformation] will be called on the
 * value. When the resulting future gets a value, the returned future
 * will receive it.
 * @description  Checks that different transformation functions
 * don't conflict with each other.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Completer chain = new Completer();

  Future t1 = f.chain((value) {
    return new Future.immediate(value * 2);
  });

  Future t2 = f.chain((value) {
    return chain.future;
  });

  Future t3 = f.chain((value) {
    throw 33;
  });

  f.then((fValue) {
    Expect.isTrue(t1.hasValue);
    Expect.equals(fValue * 2, t1.value);

    Expect.isFalse(t2.hasValue);
    chain.complete(0);
    Expect.isTrue(t2.hasValue);
    Expect.equals(0, t2.value);

    Expect.isFalse(t3.hasValue);
    Expect.equals(33, t3.exception);
  });

  completer.complete(1);
}
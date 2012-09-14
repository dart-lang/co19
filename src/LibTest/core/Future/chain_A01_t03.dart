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
 * @description  Checks that the returned future has the correct value if
 * a future returned by [transformation] already has a value.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.chain((value) {
    Completer chain = new Completer();
    Future result = chain.future;
    chain.complete(value);
    return result;
  });

  completer.complete(2);
  Expect.isTrue(t.hasValue);
  Expect.equals(2, t.value);


  completer = new Completer();
  f = completer.future;
  t = f.chain((value) {
    return new Future.immediate(value);
  });

  completer.complete(1);
  Expect.isTrue(t.hasValue);
  Expect.equals(1, t.value);
}

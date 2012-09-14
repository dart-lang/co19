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
 * the resulting future returned by [transformation] has a value before this future is completed.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Completer chain = new Completer();
  Future t = f.chain((value) {
    return chain.future;
  });

  chain.complete(111);  //returned future is completed before the first future
  completer.complete(2);
  Expect.isTrue(t.hasValue);
  Expect.equals(111, t.value);
}

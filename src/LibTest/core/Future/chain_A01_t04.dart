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
 * @description  Checks that [transformation] is called if
 * this future have a value before calling [chain].
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.complete(1);
  bool visited = false;

  Future t = f.chain((value) {
    visited = true;
    return new Future.immediate(value);
  });

  Expect.isTrue(visited);
  Expect.equals(1, t.value);

  f = new Future.immediate(2);
  visited = false;
  t = f.chain((value) {
    visited = true;
    return new Future.immediate(value);
  });

  Expect.isTrue(visited);
  Expect.equals(2, t.value);
}
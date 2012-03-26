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
 * @description  Checks that [transformation] is called with
 * the correct argument.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(value) {
  Completer completer = new Completer();
  Future f = completer.future.chain((fValue) {
    return new Future.immediate(fValue);
  });

  completer.complete(value);
  f.then((v){
      Expect.equals(value, v);
  });
}

main() {
  check(1);
  check('a');
  check(null);
  check(const [1, 2]);
}
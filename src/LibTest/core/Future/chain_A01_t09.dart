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
 * @description  Checks that [transformation] must return a Future.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(Function func) {
  Completer completer = new Completer();
  Future f = completer.future;

  f.chain(func);

  try {
    completer.complete(0);
    Expect.fail('Exception was not thrown');
  } catch(var e) {
    print(e);	
  }
}

main() {
  check((value){});
  check((value) => value);
  check((value) => 1);
  check((value) => 'not a future');
}
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
 * @description  Checks that [transformation] is not called if
 * this future is not completed with a value.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  bool called=false;
  Completer completer = new Completer();

  Future t = completer.future.chain((value) {
    called=true;
    return new Future.immediate(value);
  });
  t.then((v) {
     Expect.fail("should not complete");
  });
  
  Expect.isFalse(called, 'transformation should not be called');
}

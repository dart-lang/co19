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
 * @description  Checks that [transformation] is not called
 * if this future completes with an exception.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  bool called=false;

  Future t = f.chain((value) {
    called=true;
  });

  completer.completeException(2);
  t.handleException((e){
    return true;
  });
  
  Expect.isTrue(t.isComplete);
  Expect.isFalse(called, 'transformation should not be called');
}

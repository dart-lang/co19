/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future chain(Future transformation(value))
 * If an exception occurs (received by this future, thrown by
 * [transformation], or received by the future returned by [transformation])
 * then the returned future will receive the exception.
 * @description  Checks that if the future returned by [transformation] completes
 * with an exception the returned future is completed with that exception.
 * @author msyabro
 * @reviewer kaigorodov
 * @note issue #1917 
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Completer chain = new Completer();

  Future t = f.chain((value) {
    return chain.future;
  });

  chain.completeException(1);
  completer.complete(0);
  Expect.equals(1, t.exception);


  completer = new Completer();
  f = completer.future;

  chain = new Completer();

  t = f.chain((value) {
    return chain.future;
  });

  completer.complete(0);
  chain.completeException(1);
  Expect.equals(1, t.exception);
}
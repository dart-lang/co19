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
 * @description  Checks that if this future is completed with an exception,
 * then the returned future also is completed with that exception.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.chain((value) => new Future.immediate(0));

  completer.completeException(120);
  Expect.equals(120, t.exception);
}

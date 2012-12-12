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
 * @description  Tries to pass [:null:] as [transformation]. Checks that
 * the returned future receives an exception.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.chain(null);

  completer.complete(0);

  Expect.isTrue(t.isComplete);
  Expect.isNotNull(t.exception);
}

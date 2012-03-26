/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future transform(Function transformation)
 * If an exception occurs (received by this future, or thrown by
 * [transformation]) then the returned future will receive the exception.
 * @description Checks that if this future is completed with an exception
 * the returned future also is completed with that exception.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.transform((value) => value);

  completer.completeException(111);
  Expect.equals(111, t.exception);

}
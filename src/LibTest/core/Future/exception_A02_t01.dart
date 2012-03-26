/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object get exception()
 * If called before isComplete is true, then this exception property
 * itself throws a FutureNotCompleteException.
 * @description Checks that FutureNotCompleteException is thrown if this getter is called
 * before a future is complete.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

 try {
   f.exception;
   Expect.fail("FutureNotCompleteException is expected");
 } catch(FutureNotCompleteException e) {}
}
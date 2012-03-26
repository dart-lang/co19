/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void handleException(bool onException(Object exception))
 * If this future gets an exception, then call onException.
 * If onException returns true, then the exception is considered handled.
 * If onException does not return true (or handleException was never called),
 * then the exception is not considered handled. In that case, if there were any
 * calls to then (meaning that there are onComplete callbacks waiting for the value),
 * then the exception will be thrown when it is set.
 * @description Checks that an exception that passed into onException is
 * the exception that a future gets.
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  const C();
}

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  f.handleException((exception) {
    Expect.equals(value, exception);
    return true;
  });

  completer.completeException(value);
}

main() {
  check(1e98);
  check('exception');
  check(true);
  check(const []);
  check(const  C());
}
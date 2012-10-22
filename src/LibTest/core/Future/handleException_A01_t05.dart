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
 * then the exception will be thrown when the value is set.
 * @description Checks that if [onException] is not called, the exception will be thrown
 * when the value is set.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;

  f.then((fValue) {});

  completer.completeException(value);
}

main() {
  try {
    check(1);
    Expect.fail('FutureUnhandledException is expected');
  } on FutureUnhandledException catch(e) {
    Expect.equals(1, e.source);
  }

  try {
    check('');
    Expect.fail('FutureUnhandledException is expected');
  } on FutureUnhandledException catch(e) {
    Expect.equals('', e.source);
  }

  try {
    check(const []);
    Expect.fail('FutureUnhandledException is expected');
  } on FutureUnhandledException catch(e) {
    Expect.equals(const [], e.source);
  }
}

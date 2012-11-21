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
 * @description Tries to pass [:null:] as [onException]. Checks that
 * [:null:] is invoked as a function and the correct exception is thrown.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview operator call is not implemented, behavior differs from the spec. issue 1604
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  f.handleException(null);

  try {
    completer.completeException('');
    Expect.fail('Error is expected');
  } on Error catch(e) {}
}

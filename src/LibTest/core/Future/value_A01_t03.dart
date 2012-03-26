/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T get value()
 * The value this future provided.
 * (If called when hasValue is false, then throws an exception.)
 * @description Checks that if this getter is called when a future
 * was completed with exception, an exception is thrown.
 * @author msyabro
 * @needsreview the exception is not specified.
 */

checkException(ex) {
  Completer completer = new Completer();
  Future f = completer.future;

  completer.completeException(ex);

  try {
    f.value;
    Expect.fail('Exception was not thrown');
  } catch(var e) {
  }
}

main() {
  checkException(new NullPointerException());
  checkException(1);
  checkException('aaaaaa');
  checkException(new Object());
  checkException((){});
  checkException(true);
  checkException([1, 2, 3]);
}
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object get exception()
 * Exception that occurred (null if no exception occurred).
 * @description Checks that [get exception] returns the correct value.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(e) {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.completeException(e);
  Expect.equals(e, f.exception);
}


main() {
  check(25);
  check("String");
  check(true);
  check('');
  check(false);
  check(-0.879);
}
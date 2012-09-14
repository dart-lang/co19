/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object get exception()
 * Exception that occurred (null if no exception occurred).
 * @description Checks that null is returned if no exception occurred.
 * @author msyabro
 * @reviewer kaigorodov
 */

check(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.complete(value);
  Expect.isNull(f.exception);

  Future fImmediate = new Future.immediate(value);
  Expect.isNull(fImmediate.exception);
}


main() {
  check("String");
  check(true);
  check(null);
  check(-0.879);
  check([1, 2, 3]);
  check(() => {});
  check(new Object());
}

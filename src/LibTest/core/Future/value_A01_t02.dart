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
 * does not have a value, an exception is thrown.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview the exception is not specified.
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Expect.throws(() => f.value);
}

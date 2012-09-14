/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete(value)
 * FutureAlreadyCompleteException is thrown if a future is already completed.
 * FutureAlreadyCompleteException is thrown if the completer is already completed.
 * @description Checks that an Exception is thrown if
 * the completer is already completed with a value.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview undocumented
 */

main() {
  var completer = new Completer();
  var future = completer.future;
  completer.complete('value');

  try {
    completer.complete('another value');
    Expect.fail('an Exception is expected');
  }  catch(Exception e) {}
}

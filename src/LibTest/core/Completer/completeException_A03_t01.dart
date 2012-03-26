/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeException(Object exception)
 * FutureAlreadyCompleteException is thrown if a future is already completed.
 * @description Checks that an Exception is thrown if
 * the completer is already completed with a value.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview undocumented
 */

main() {
  var completer = new Completer();
  completer.complete('value');

  try {
    completer.completeException('another value');
    Expect.fail('FutureAlreadyCompleteException is expected');
  }  catch(Exception e) {}
}
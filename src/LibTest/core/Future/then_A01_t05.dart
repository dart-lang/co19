/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void then(void onComplete(value))
 * When this future is complete and has a value,
 * then call the onComplete callback function with the value.
 * @description Tries to pass [:null:] as [onComplete]. Checks that
 * [:null:] is invoked as a function and the correct exception is thrown.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview operator call is not implemented, behavior differs from the spec. issue 1604
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  f.then(null);
  try {
    completer.complete(0);
    Expect.fail('NullPointerException is expected');
  } on NullPointerException catch(e) {}
}

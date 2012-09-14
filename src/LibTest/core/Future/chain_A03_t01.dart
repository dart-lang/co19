/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future chain(Future transformation(value))
 * You must not add exception handlers to [this] future prior to calling
 * chain, and any you add afterwards will not be invoked.
 * @description  Checks that an exception handler, added to a future
 * after calling [chain], will not be invoked if exception is thrown in
 * a transformation function.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.chain((value) {
    return new Future.immediate(value);
  });

  f.handleException((exception) {
    Expect.fail('exception handler should not be called');
  });

  completer.completeException(0);
}

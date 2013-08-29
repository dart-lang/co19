/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future catchError(onError(Object error), {bool test(Object error)})
 * When this completes with an error, test is called with the error's value.
 * If the invocation returns true, onError is called with the error.
 * The result of onError is handled exactly the same as for then's onError.
 * If test returns false, the exception is not handled by onError, but is thrown unmodified,
 * thus forwarding it to f.
 * If test is omitted, it defaults to a function that always returns true.
 * @description Checks that [onError] is called if [test] is omitted and the future gets an exception.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  f.catchError((Object asyncError) {
    asyncEnd();
  });

  asyncStart();
  completer.completeError("!");
}

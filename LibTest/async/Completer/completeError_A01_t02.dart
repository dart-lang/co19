/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * Complete future with an error. Completing a future with an error indicates
 * that an exception was thrown while trying to produce a value.
 * If error is a Future, the future itself is used as the error value.
 * @description Checks that a stackTrace can be passed to completeError.
 * @author ilya
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;

  var error = new Error();
  var stackTrace;

  asyncStart();

  try {
    throw error;
  } catch(e, st) {
    stackTrace = st;
    completer.completeError(e, st);
  }

  future.then(
          (fValue) => Expect.fail('should not get here'),
          onError:(e, st) {
            Expect.identical(error, e);
            Expect.identical(stackTrace, st);
            asyncEnd();
          }
    );
}


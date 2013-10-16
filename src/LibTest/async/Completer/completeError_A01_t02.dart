/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void completeError(Object exception, [Object stackTrace])
 * Complete future with an error. Completing a future with an error indicates that
 * an exception was thrown while trying to produce a value.
 * @description Checks that a stackTrace can be passed to completeError.
 * @author ilya
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;

  try {
    throw 1;
  } catch(e, st) {
    completer.completeError(e, st);
  }
  
  asyncStart();
  future
    .then((fValue) {Expect.fail('should not get here');})
    .catchError((asyncError) {
      Expect.equals(1, asyncError);
      asyncEnd();
    });
}


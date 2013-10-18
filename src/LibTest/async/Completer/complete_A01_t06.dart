/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values. All listeners on the future are
 * informed informed about the value.
 * @description Checks that if a value is another future which completes with 
 * the error e, completer's future will complete with the error e.
 * @author ilya
 * @note undocumented
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var completer = new Completer();
  var future = completer.future;

  var error = new Error();

  asyncStart();

  future.catchError((x) {
    Expect.identical(error, x);
    asyncEnd();
  });

  completer.complete(new Future.error(error));
}

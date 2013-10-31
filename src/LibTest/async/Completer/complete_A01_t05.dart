/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values.
 * If the value is itself a future, the completer will wait for that future to
 * complete, and complete with the same result, whether it is a success or an
 * error.
 * All listeners on the future are informed about the value.
 * @description Checks that if a value is another future which completes
 * with the value v, completer's future will complete with the value v.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var completer = new Completer();
  var future = completer.future;

  var value = [1,2,3];

  asyncStart();

  future.then((x) {
    Expect.identical(value, x);
    asyncEnd();
  });

  completer.complete(new Future.value(value));
}

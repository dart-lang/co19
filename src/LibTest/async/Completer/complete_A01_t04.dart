/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void complete([T value])
 * Completes future with the supplied values. All listeners on the future are
 * informed informed about the value.
 * @description Checks that all listeners on the future are informed.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

int N=10;
const v=99;

main() {
  var completer = new Completer();
  var future = completer.future;

  for (int k=0; k<N; k++) {
    asyncStart();
    future.then((fValue) {
      Expect.equals(v, fValue);
      asyncEnd();
    });
  }

  completer.complete(v);
}

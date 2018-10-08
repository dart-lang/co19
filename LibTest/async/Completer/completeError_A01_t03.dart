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
 * @description Checks that if exception is another future f which completes
 * with the value v, completer's future will complete with the error f.
 * @author ilya
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;

  var v = [1,2,3];

  asyncMultiStart(2);

  var f = new Future.value(v).then((x) {
    asyncEnd();
    return x;
  });

  future
    .catchError((e) {
      Expect.identical(f, e);
      asyncEnd();
    });

  completer.completeError(f);
}


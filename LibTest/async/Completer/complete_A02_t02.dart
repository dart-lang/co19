/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete([T value])
 * Calling complete or completeError must not be done more than once.
 * @description Checks that an error is thrown if
 * the completer is already completed with an exception.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;
  future.catchError((Object e) => 1);
  completer.completeError(0);

  Expect.throws(() => completer.complete('another value'));
}

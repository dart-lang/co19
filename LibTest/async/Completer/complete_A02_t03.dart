/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete([T value])
 * Calling complete or completeError must not be done more than once.
 * @description Checks that an error is thrown if
 * the completer is already completed with Future instance, that is not
 * completed yet.
 * @author a.semenov@unipro.ru
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Completer completer1 = new Completer();
  Completer completer2 = new Completer();
  completer1.complete(completer2.future);

  Expect.throws(() => completer1.complete('another value'));
}

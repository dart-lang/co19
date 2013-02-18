/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete(value)
 * StateError is thrown if the completer is already completed.
 * @description Checks that a StateError is thrown if
 * the completer is already completed with an exception.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;
  future.catchError((AsyncError e)=>1);
  completer.completeError(0);

  try {
    completer.complete('another value');
    Expect.fail('StateError is expected');
  }  on StateError catch(e) {}
}

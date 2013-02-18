/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * StateError is thrown if a future is already completed.
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
  completer.future.catchError((AsyncError e)=>1);
  completer.completeError('value');

  try {
    completer.completeError('another value');
    Expect.fail('StateError is expected');
  } on StateError catch(e) {}
}

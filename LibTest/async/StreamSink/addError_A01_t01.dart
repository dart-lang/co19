/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addError(errorEvent, [StackTrace stackTrace])
 * Create an async error.
 * @description Checks that error events with and without stack can be added.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();
  var sink = c.sink;
  var stackTrace;

  sink.addError(1);
  try {
    throw 2;
  } catch(e,st) {
    stackTrace = st;
    sink.addError(e, st);
  }

  var first = true;
  asyncStart();
  c.stream.listen(null, onError:(e,st) {
    if (first) {
      Expect.identical(1, e);
      Expect.identical(null, st);
      first = false;
    } else { 
      Expect.identical(2, e);
      Expect.identical(stackTrace, st);
      asyncEnd();
    }
  });

  c.close();
}

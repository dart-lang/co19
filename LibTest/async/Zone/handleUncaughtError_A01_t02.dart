/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic handleUncaughtError(error, StackTrace stackTrace)
 * @description Checks that handleUncaughtError callback can be set via
 * ZoneSpecification and that correct callback is invoked.
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

var error = 1;
var stackTrace;

test() {
  try {
    throw error;
  } catch (e,st) {
    stackTrace = st;
    Zone.current.handleUncaughtError(e, st);
  }
}

myErrorHandler(Zone self, ZoneDelegate parent, Zone zone, e, st) {
  Expect.identical(error, e);
  Expect.identical(stackTrace, st);
}

main() {
  Zone.current.fork(specification: new ZoneSpecification(handleUncaughtError:
        myErrorHandler)).run(test);
}


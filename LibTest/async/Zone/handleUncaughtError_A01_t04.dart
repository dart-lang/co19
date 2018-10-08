/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void handleUncaughtError(error, StackTrace stackTrace)
 *  Handles uncaught asynchronous errors.
 * @description Checks that handleUncaughtError callback can be set via
 * ZoneSpecification and that correct callback is invoked. Async case.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

int count = 0;
var stackTraces={};

HandleUncaughtErrorHandler newHandler() {
  int id = ++count;
  return (Zone self, ZoneDelegate parent, Zone zone, e, st) {
    //print('Error handler #$id');
    Expect.identical(id, e);
    Expect.identical(stackTraces[id], st);
    asyncEnd();
  };
}

Zone newErrorZone(Zone z) =>
  z.fork(specification: new ZoneSpecification(handleUncaughtError: newHandler()));

void test() {
  try {
    throw count; // i-th error should be caught by i-th handler
  } catch (e, st) {
    stackTraces[count] = st;

    asyncMultiStart(2);

    new Future.error(e,st);

    runZoned(() {
      // in same error zone as parent zone
      new Future.error(e,st);
    });
  }

  if (count < 10) {
    newErrorZone(Zone.current).run(test);
  }
}

main() {
  newErrorZone(Zone.current).run(test);
}

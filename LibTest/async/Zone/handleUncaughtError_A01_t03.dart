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

var count = 0;
var stackTraces={};

newHandler() {
  var id = ++count;
  return (Zone self, ZoneDelegate parent, Zone zone, e, st) {
    //print('Error handler #$id');
    Expect.identical(id, e);
    Expect.identical(stackTraces[id], st);
  };
}

newErrorZone (Zone z) =>
  z.fork(specification: new ZoneSpecification(handleUncaughtError: newHandler()));

test() {
  try {
    throw count; // i-th error should be caught by i-th handler
  } catch (e, st) {
    stackTraces[count] = st;
    Zone.current.handleUncaughtError(e, st);
  }

  if (count < 10) {
    newErrorZone(Zone.current).run(test);
  }
}

main() {
  newErrorZone(Zone.current).run(test);
}


/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool inSameErrorZone(Zone otherZone)
 * Returns true if this and otherZone are in the same error zone.
 * Two zones are in the same error zone if they share the same
 * handleUncaughtError callback.
 * @description Checks that inSameErrorZone returns true if zones share the
 * same handleUncaughtError callback and false otherwise. Async cases.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

var count=0;

HandleUncaughtErrorHandler newHandler() {
  return (Zone self, ZoneDelegate parent, Zone zone, e, st) {
    Expect.fail('shoud not be called');
  };
}

newErrorZone (Zone z) =>
  z.fork(specification: new ZoneSpecification(handleUncaughtError: newHandler()));

main() {
  var z = Zone.current;

  same ([_]) {
    Expect.isTrue(Zone.current.inSameErrorZone(z));
    asyncEnd();
  }

  diff ([_]) {
    Expect.isFalse(Zone.current.inSameErrorZone(z));
    asyncEnd();
  }

  asyncStart();
  scheduleMicrotask(same); // the same zone

  asyncStart();
  z.fork().scheduleMicrotask(same); // both do not have error callback

  asyncStart();
  new Future.value(1).then(same); // the same zone

  asyncStart();
  new Future.error(1).catchError(same); // the same zone

  asyncStart();
  newErrorZone(z).scheduleMicrotask(diff); // child is new error zone
}


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
 * same handleUncaughtError callback and false otherwise.
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

same () => Expect.isTrue(Zone.current.inSameErrorZone(Zone.current.parent));
diff () => Expect.isFalse(Zone.current.inSameErrorZone(Zone.current.parent));

main() {
  var z = Zone.current;

  runZoned(same);     // both do not have error callback
  z.fork().run(same); //

  newErrorZone(z).run(() {
    runZoned(same);     // parent is error zone, child is not and shares callback
    z.fork().run(same); //
  });
  
  runZoned(diff, onError: (_,__) {}); // child is new error zone
  newErrorZone(z).run(diff);          // child is new error zone


  newErrorZone(z).run(() {
    newErrorZone(Zone.current).run(diff); // have different error callbacks
  });
}


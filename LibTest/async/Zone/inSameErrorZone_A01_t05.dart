// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract bool inSameErrorZone(Zone otherZone)
/// Returns true if this and otherZone are in the same error zone.
/// Two zones are in the same error zone if they share the same
/// handleUncaughtError callback.
/// @description Checks that errors are handled by the error zone callbacks.
/// @author ilya

import "dart:async";
import "../../../Utils/expect.dart";

same() {
  Zone? z = Zone.current.parent;
  if (z != null) {
    Expect.isTrue(Zone.current.inSameErrorZone(z));
  return;
  }
  Expect.fail("Zone.current.parent is null");
}

diff() {
  Zone? z = Zone.current.parent;
  if (z != null) {
    Expect.isFalse(Zone.current.inSameErrorZone(z));
  return;
  }
}
main() {
  runZonedGuarded(() {
    asyncStart();
    var f = new Future.error(1);

    runZonedGuarded(() {
      // new error zone
      diff();
      // catchError is registered in different error zone
      // error is not caught by catchError, neither by this error zone handler
      f.catchError((_) {
         Expect.fail('Future completed with unexpected error');
      });
    }, (_, __) {
      Expect.fail('Unexpected error in runZonedGuarded call');
    });
  }, (e, st) {
    Expect.equals(1, e);
    asyncEnd();
  });
}

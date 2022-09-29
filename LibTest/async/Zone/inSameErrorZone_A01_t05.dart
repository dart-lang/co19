// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion abstract bool inSameErrorZone(Zone otherZone)
/// Returns true if this and otherZone are in the same error zone.
/// Two zones are in the same error zone if they share the same
/// handleUncaughtError callback.
/// @description Checks that errors are handled by the error zone callbacks.
/// @author ilya


import "dart:async";
import "../../../Utils/expect.dart";

same () => Expect.isTrue(Zone.current.inSameErrorZone(Zone.current.parent));
diff () => Expect.isFalse(Zone.current.inSameErrorZone(Zone.current.parent));

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
         Expect.fail('should not happen');
      });
    }, (_, __) {
      Expect.fail('Unexpected error');
    });
  }, (e, st) {
    Expect.equals(1, e);
    asyncEnd();
  });
}


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
 * @description Checks that errors are handled by the error zone callbacks.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

same () => Expect.isTrue(Zone.current.inSameErrorZone(Zone.current.parent));
diff () => Expect.isFalse(Zone.current.inSameErrorZone(Zone.current.parent));

main() {
  runZoned(() {
    asyncStart();
    var f = new Future.error(1);

    runZoned(() {
      // not error zone, shares callback with the parent
      same();
      // catchError is registered in same error zone
      // error is caught by catchError
      f.catchError((_) {
        asyncEnd();
      });
    });
  }, onError: (e) {
    Expect.fail('should not happen');
  });
}


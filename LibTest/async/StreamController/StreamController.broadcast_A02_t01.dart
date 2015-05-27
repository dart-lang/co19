/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamController.broadcast({void onListen(), void onCancel(), bool sync: false})
 * It is not allowed to call add, addError, or close before a previous call has returned.
 * @description Checks that it is not allowed to call add, addError or close
 * before a previous call has returned.
 * @needsreview Will only work if events for sync:true are indeed delivered
 * synchronously. The doc states that they _may be_ passed directly.
 * @author ilya
 */

/*
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController.broadcast(sync:true);

  c.stream.listen((_) {
    Expect.throws(() => c.add(2));
    Expect.throws(() => c.addError(2));
  }, onError: (_) {
    Expect.throws(() => c.add(2));
    Expect.throws(() => c.addError(2));
  }, onDone: () {
    Expect.throws(() => c.close());
  });

  c.add(1);
  c.addError(1);
  c.close();
}
*/

main() {}

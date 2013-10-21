/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> last
 * If an error event occurs before the first data event, the resulting future
 * is completed with that error.
 * @description Checks that if error event occurs before the first data
 * event, the future completes with that error.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var error = new Error();
  var c;
  c = new StreamController(onListen:() {c.addError(error);});
  asyncStart();
  c.stream.last.catchError((e) {
    Expect.identical(error, e);
    asyncEnd();
  });
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.error(error, [Object stackTrace])
 * A future that completes with an error in the next event-loop iteration.
 * @description Checks that a stackTrace can be passed to Future.error.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var value = [1,2,3];
  Future future;

  try {
    throw value;
  } catch(e, st) {
    future = new Future.error(e, st);
  }
  
  asyncStart();
  future.catchError((error) {
    Expect.identical(value, error);
    asyncEnd();
  });
}

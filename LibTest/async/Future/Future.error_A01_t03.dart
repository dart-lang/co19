/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.error(error, [Object stackTrace])
 * A future that completes with an error in the next event-loop iteration.
 * If error is null, it is replaced by a NullThrownError.
 * @description Checks that the future is completed in the next event-loop
 * iteration
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  bool inMain = true;
  asyncStart();
  new Future.error("@")
    .catchError((_) {
      Expect.isFalse(inMain);
      asyncEnd();
    });
  inMain = false;
}

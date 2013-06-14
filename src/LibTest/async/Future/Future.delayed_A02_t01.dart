/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.delayed(Duration duration, [T computation()])
 * If computation is not given or null then it will behave as if computation was set to () => null.
 * That is, it will complete with null.
 * @description Checks that if computation is not given or null,
 * then it will behave as if computation was set to () => null.
 * @author kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Future future = new Future.delayed(Duration.ZERO);
  asyncStart();
  future.then((fValue) {
    Expect.equals(null, fValue);
    asyncEnd();
  });

  asyncStart();
  future = new Future.delayed(Duration.ZERO, null);
  future.then((fValue) {
    Expect.equals(null, fValue);
    asyncEnd();
  });
}

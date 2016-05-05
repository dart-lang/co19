/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future.delayed(Duration duration, [dynamic  computation()])
 * If computation is omitted, it will be treated as if computation was set to
 * () => null, and the future will eventually complete with the null value.
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

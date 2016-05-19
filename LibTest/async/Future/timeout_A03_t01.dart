/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> timeout(Duration timeLimit, {dynamic onTimeout()})
 * Time-out the future computation after timeLimit has passed.
 * . . .
 * If onTimeout is omitted, a timeout will cause the returned future to complete
 * with a TimeoutException.
 *
 * @description Checks that if onTimeout is omitted, a timeout causes the
 * returned future to complete with a TimeoutException.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

check(var value) {
  Completer c = new Completer();
  Future future = c.future;

  Future f1 = future.timeout(new Duration(microseconds:1));

  asyncStart();
  f1.then((fValue) {
    Expect.fail("Shouldnot be here");
    asyncEnd();
  },
  onError: (e) {
    Expect.isTrue(e is TimeoutException);
    asyncEnd();
  }
  );
}

main() {
  check(0);
  check(1);
  check(-5);
  check('');
  check('string');
  check(null);
  check(true);
  check(const []);
  check(const {'k1': 1, 'k2': 2});
}

/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> timeout(Duration timeLimit, {dynamic onTimeout()})
 * Time-out the future computation after timeLimit has passed.
 * . . .
 * If this future does not complete before timeLimit has passed, the onTimeout
 * action is executed instead, and its result (whether it returns or throws) is
 * used as the result of the returned future. The onTimeout function must return
 * a T or a Future<T>.
 *
 * @description Checks that if future does not complete before timeLimit has
 * passed, the onTimeout action is executed instead. The onTimeout returns new
 * Future completed with 55.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

ontimeout() {
  return new Future(() => 55);
}

check(var value) {
  Completer c = new Completer();
  Future future = c.future;

  Future f1 = future.timeout(new Duration(microseconds:1),
      onTimeout: ontimeout);

  asyncStart();
  f1.then((fValue) {
    Expect.identical(55, fValue);
    asyncEnd();
  });
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

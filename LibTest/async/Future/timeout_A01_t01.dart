/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> timeout(Duration timeLimit, {dynamic onTimeout()})
 * Time-out the future computation after timeLimit has passed.
 *
 * Returns a new future that completes with the same value as this future, if
 * this future completes in time.
 *
 * @description Checks that returned future is completed with with the same
 * value as this future, if this future completes in time.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(var value) {
  asyncStart();
  Future future = new Future.value(value);
  future.timeout(new Duration(milliseconds:1)).then(
    (v) {
      Expect.identical(value, v);
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

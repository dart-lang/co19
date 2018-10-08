/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 *    If the callback returns a Future, the future returned by then will be
 * completed with the same result as the future returned by the callback.
 * @description Checks that the future returned by [then] completes with the same
 * result as the future returned by the callback.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

check(Object value) {
  asyncStart();
  new Future.value("1").then(
      (_) {
        return new Future.value(value);
      }
  ).then(
      (v) {
        Expect.identical(value, v);
        asyncEnd();
      }
  );
}

main() {
  check("0");
  check(20);
  check(null);
  check(3.14);
  check(new Object());
}

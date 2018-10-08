/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 *    If onError is not given, and this future completes with an error, the error
 * is forwarded directly to the returned future.
 * @description Checks that if onError is not given, the error is forwarded
 * directly to the returned future.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";


void check(Object value) {
  asyncStart();
  new Future.error(value).then(
      (_) {
        Expect.fail("Initial future should complete with error");
      }
  ).then(
      (_) {
        Expect.fail("Returned future should complete with error");
      },
      onError: (error) {
        Expect.equals(value, error);
        asyncEnd();
      }
  );
}

main() {
    check("0");
    check(20);
    check(3.14);
    check(new Error());
}

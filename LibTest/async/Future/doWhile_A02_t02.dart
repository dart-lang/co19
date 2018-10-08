/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(FutureOr<bool> f())
 *    Perform an async operation repeatedly until it returns false.
 * . . .
 *    If a future returned by f completes with an error, iteration ends and
 * the future returned by doWhile completes with the same error.
 *
 * @description Checks that if [f] returns future, which completes with error,
 * then returned future is completed with this error.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

const int N = 4;

main() {
  int num = 0;

  FutureOr<bool> f() {
    if (num == 2) return new Future.error("@");
    num++;
    return new Future.value(num < N);
  }

  asyncStart();
  Future.doWhile(f).then(
    (_) {
      Expect.fail("Returned future should fail with error");
    },
    onError: (e) {
      Expect.equals(2, num);
      Expect.equals("@", e);
      asyncEnd();
    }
  );
}

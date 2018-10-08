/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(FutureOr<bool> f())
 * Perform an async operation repeatedly until it returns false.
 * . . .
 * Otherwise it waits for the returned Future to complete.
 *
 * @description Checks that if [f] returns not completed future, [doWhile]
 * waits for the returned Future to complete.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

const int N = 4;

main() {
  int num = 0;

  FutureOr<bool> f() {
    num++;
    return new Future.delayed(durationMs(100), () => (num < N));
  }

  asyncStart();
  Future.doWhile(f).then(
    (_) {
      Expect.equals(N, num);
      asyncEnd();
    }
  );
}

/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future doWhile(FutureOr<bool> f())
 *    Performs an async operation repeatedly until it returns false.
 *    The function f is called repeatedly while it returns either the bool
 * value true or a Future which completes with the value true.
 *    If a call to f returns false or a Future that completes to false,
 * iteration ends and the future returned by doWhile is completed.
 *
 * @description Checks that [doWhile] handles a mix of bool and Future<bool>
 * values returned by [f].
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

const int N = 10;

main() {
  int num = 0;

  FutureOr<bool> f() {
    num++;
    return (num%2==0) ? num < N : new Future.value(num < N);
  }

  asyncStart();
  Future.doWhile(f).then(
    (_) {
      Expect.equals(N, num);
      asyncEnd();
    }
  );
}

/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, Future f(element))
 * If f returns a non-Future, iteration continues immediately. Otherwise it
 * waits for the returned Future to complete.
 * @description Checks that if f returns a non-Future, iteration continues
 * immediately.
 * @author ngl@unipro.ru
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

List input = [0,1,2,3,4];
int N = input.length;
int e2nonf = 2;

main() {
  List<bool> operationTrace = new List<bool>(N);

  for (int k = 0; k < N; k++) {
    operationTrace[k] = false;
  }

  Future ff(int element) {
    if (element == e2nonf) {
       return null;
    }
    operationTrace[element] = true;
    return new Future.sync(() => element);
  }

  asyncStart();
  Future f = Future.forEach(input, ff);

  f.then((fValue) {
    Expect.equals(fValue, null);
    Expect.listEquals([true, true, false, true, true], operationTrace);
    asyncEnd();
  });
}

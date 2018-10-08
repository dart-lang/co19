/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * If an error event occurs before the value is found, the future completes
 * with this error.
 * @description Checks that if an error event occurs before the value is found,
 * the future will end with this error.
 * @author kaigorodov
 */
library elementAt_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  for (int k=0; k<10; k++) {
    Iterable<int> i = new Iterable<int>.generate(10, (int x) => x);
    Stream<int> s = create(i, isError:(e) => e==k);
    AsyncExpect.error(k, s.elementAt(k));
  }
}

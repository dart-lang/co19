/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @description Checks that [f] is not called if list is empty
 * @author kaigorodov
 */
library every_A02_t02;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable a = create();
  int actualCount = 0;
  a.every((var e) {
    actualCount++;
    return e;
  });
  Expect.equals(0, actualCount);
}

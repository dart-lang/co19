/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeAt(int index)
 * Throws an UnsupportedError, and doesn't remove the element, if the length of
 * the list cannot be changed.
 * @description Checks that an UnsupportedError is thrown if the length of
 * the list cannot be changed.
 * @author kaigorodov
 */
library removeAt_A04_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  check(List a0, int index) {
    List a = create(a0.length);
    a.setRange(0, a0.length, a0);
    Expect.throws(() {a.removeAt(index);}, (e) => e is UnsupportedError);
  }

  check(const [1, 2], 0);
  check(const [1, 2, 3], 2);
  check(new List.from([1, 2, 3, 4], growable:false), 3);
}

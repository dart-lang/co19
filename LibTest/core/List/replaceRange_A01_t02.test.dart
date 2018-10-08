/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void replaceRange(int start, int end, Iterable<E> iterable)
 * It is an error if start.. end is not a valid range pointing into the this.
 * @description Checks that an error is thrown when the range is invalid.
 * @author kaigorodov
 */
library replaceRange_A01_t02;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0, int start, int end, Iterable iterable) {
    List a = create();
    a.addAll(a0);
    Expect.throws(() {a.replaceRange(start, end, iterable);});
  }

  List a0 = [1, 3, 3, 4, 5, 6];
  check(a0, -1, -1, [7, 8, 9]);
  check(a0, 0, -1, [7, 8, 9]);
  check(a0, 1, 0, [8, 9]);
  check(a0, a0.length + 1, a0.length, [7, 8, 9, 10]);
  check(a0, a0.length - 1, a0.length + 1, [-1, 7, 8, 9]);
  check(a0, -1, a0.length + 1, [7, 8, 9, 10]);
}

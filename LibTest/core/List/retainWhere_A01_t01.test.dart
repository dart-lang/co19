/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void retainWhere(bool test(E element))
 * Removes all elements of this list that fail to satisfy test.
 * An elements e satisfies test if test(e) is true.
 * @description Checks that all elements that satisfy test are left, and
 * elements that does not are removed.
 * @author kaigorodov
 */
library retainWhere_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0, bool test(var element)) {
    List a = create();
    a.addAll(a0);
    a.retainWhere(test);
    int k = 0;
    for (int k0 = 0; k0 < a0.length; k0++) {
      if (test(a0[k0])) {
        Expect.identical(a0[k0], a[k], "k0=$k0, k=$k");
        k++;
      }
    }
    Expect.equals(a.length, k, "a.length=${a.length} k=$k");
  }

  List a0 = [1, 3, 3, 4, 5, 6];
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}

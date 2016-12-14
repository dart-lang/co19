/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeAt(int index)
 * Removes the element at position index from the list.
 * This reduces the length of the list by one and moves all later elements down
 * by one position. Returns the removed element.
 * @description Checks that the element at the index is removed. Checks that the
 * removed element is returned.
 * @author kaigorodov
 */
library removeAt_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  check(List a0, int index) {
    List a = create();
    a.addAll(a0);
    var r = a.removeAt(index);
    Expect.equals(a0[index], r);
    Expect.equals(a0.length - 1, a.length);
    for (int k = 0; k < index; k++) {
      Expect.identical(a0[k], a[k]);
    }
    for (int k = index; k < a.length; k++) {
      Expect.identical(a0[k + 1], a[k]);
    }
  }

  List a0 = [1, 3, 3, 4, 5, 6];
  check(a0, a0.length - 1);
  check(a0, 0);
  check(a0, 3);
}

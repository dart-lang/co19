/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void replaceRange(int start, int end, Iterable<E> iterable)
 * Removes the elements in the range start to end exclusive and replaces them
 * with the contents of the iterable.
 * @description Checks that the elements within the range are replaced with
 * elements of iterable, and elements out of the range are retained.
 * @author kaigorodov
 */
library replaceRange_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0, int start, int end, Iterable iterable) {
    List a = create();
    a.addAll(a0);
    a.replaceRange(start, end, iterable);
    Expect.equals(a0.length + start - end + iterable.length, a.length);
    for (int k0 = 0; k0 < start; k0++) {
      Expect.identical(a0[k0], a[k0]);
    }
    int k = start;
    for (var element in iterable) {
      Expect.identical(element, a[k]);
      k++;
    }
    for (int k0 = end; k0 < a0.length; k0++,k++) {
      Expect.identical(a0[k0], a[k], "a0[$k0]=${a0[k0]}, a[$k]=${a[k]}, a=$a");
    }
  }

  List a0=[1, 3, 3, 4, 5, 6];
  check(a0, 0, 0, [7, 8, 9]);
  check(a0, 0, 1, [8, 9]);
  check(a0, 2, 2, [7, 8]);
  check(a0, 2, 4, [7, 8, 9]);
  check(a0, a0.length-1, a0.length, [7, 8, 9, 10]);
  check(a0, a0.length-1, a0.length-1, [-1, 7, 8, 9]);
}

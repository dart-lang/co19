/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void insertAll(int index, Iterable<E> iterable)
 * Inserts all elements of iterable at position index in the list.
 * This increases the length of the list by the length of iterable and shifts
 * all later elements towards the end of the list.
 * @description Checks that the elements from iterable are inserted.
 * @author kaigorodov
 */
library insertAll_A01_t01;

import "../../../Utils/expect.dart";

void check(List create([int length]), List a0, int index, Iterable elements) {
  List a = create();
  a.insertAll(0, a0);

  a.insertAll(index, elements);
  Expect.equals(a0.length + elements.length, a.length);
  for (int k = 0; k < index; k++) {
    Expect.identical(a0[k], a[k]);
  }
  int k = 0;
  for (var element in elements) {
    Expect.identical(element, a[index+k]);
    k++;
  }
  for (int k = index; k < a0.length; k++) {
    Expect.identical(a0[k], a[k + elements.length]);
  }
}

test(List create([int length])) {
  List a0 = [1, 3, 3, 4, 5, 6];
  check(create, a0, 0, [10, 20, 33]);
  check(create, a0, 3, [-10, 20, 33]);
  check(create, a0, a0.length-1, [10, null, 33]);
  check(create, a0, a0.length, [10, 20, -33, null]);
}

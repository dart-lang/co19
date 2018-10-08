/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void insert(int index, E element)
 * Inserts the element at position index in the list.
 * This increases the length of the list by one and shifts all elements at
 * or after the index towards the end of the list.
 * @description Checks that the element at the index is set to the given element.
 * @author kaigorodov
 */
library insert_A01_t01;

import "../../../Utils/expect.dart";

void check(List create([int length]), List a0, int index, var element) {
  List a = create();
  a.insertAll(0, a0);
  a.insert(index, element);
  Expect.equals(a0.length + 1, a.length);
  for (int k = 0; k < index; k++) {
    Expect.identical(a0[k], a[k]);
  }
  Expect.identical(element, a[index]);
  for (int k = index; k < a0.length; k++) {
    Expect.identical(a0[k], a[k+1]);
  }
}

test(List create([int length])) {
  List a0 = [1, 3, 3, 4, 5, 6];
  check(create, a0, 0, -1);
  check(create, a0, 3, -2);
  check(create, a0, a0.length-1, -3);
  check(create, a0, a0.length, -4);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void insert(int index, E element)
 * It is an error if the index does not point inside the list or at the position
 * after the last element.
 * @description Checks that it is an error if the index does not point inside
 * the list or at the position after the last element.
 * @author kaigorodov
 */
library insert_A02_t01;

import "../../../Utils/expect.dart";

void check(List a, int index, var element) {
  Expect.throws(() {a.insert(index, element);});
}

test(List create([int length])) {
  List a0 = [1, 3, 3, 4, 5, 6];
  List a = create();
  a.insertAll(0, a0);
  check(a0, -1, -1);
  check(a0, -1000, -2);
  check(a0, a0.length + 1, -3);
  check(a0, a0.length * 1000, -4);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void insertAll(int index, Iterable<E> iterable)
 * It is an error if the index does not point inside the list or at the position
 * after the last element.
 * @description Checks that it is an error if the index does not point at the
 * position inside the list or after the last element.
 * @author kaigorodov
 */
library insertAll_A02_t01;

import "../../../Utils/expect.dart";

void check(List a, int index, Iterable elements) {
  Expect.throws(() {a.insertAll(index, elements);}, (e) => e is RangeError);
}

test(List create([int length])) {
  List a0 = [1, 3, 3, 4, 5, 6];
  List a = create();
  a.insertAll(0, a0);
  check(a, -1, a0);
  check(a, -1000, a0);
  check(a, a.length + 1, a0);
  check(a, a.length * 1000, a0);
}

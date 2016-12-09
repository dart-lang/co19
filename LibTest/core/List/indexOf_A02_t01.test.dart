/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int indexOf(E element, [int start = 0])
 * There is no restriction on the value of [startIndex]. 
 * If it is negative, it has the same effect as if it were zero: this entire list may be searched. 
 * If it is greater than the [:length:] of this list, it has the same effect 
 * as if it were equal to the [:length:]: -1 is returned.
 * @note undocumented
 * @description Checks that [startIndex] can be out of bounds.
 * @author iefremov
 * @author varlax
 */
library indexOf_A02_t01;

import "../../../Utils/expect.dart";

checkList(List list, var elem, int idx, int expected) {
  Expect.equals(expected, list.indexOf(elem, idx));
}

check(List ls) {
  checkList(ls, 42, -1, 0);
  checkList(ls, 777, -1, -1);
  checkList(ls, null, -1, -1);
  checkList(ls, 0, -1, 1);

  checkList(ls, 42, 7, -1);
  checkList(ls, 777, 7, -1);
  checkList(ls, null, 7, -1);
  checkList(ls, 0, 7, -1);

  checkList(ls, 42, 6031769, -1);
  checkList(ls, 777, 6031769, -1);
  checkList(ls, null, 6031769, -1);
  checkList(ls, 0, 6031769, -1);

  checkList(ls, 42, -6031769, 0);
  checkList(ls, 777, -6031769, -1);
  checkList(ls, null, -6031769, -1);
  checkList(ls, 0, -6031769, 1);
}

test(List create([int length])) {
  List a = create();
  a.addAll(const [42, 0, -1, 42, -1, 6031769, 0]);

  check(a);

  List b = create(a.length);
  for(var i = 0; i<a.length; i++) {
    b[i] = a[i];
  }
  check(b);
}

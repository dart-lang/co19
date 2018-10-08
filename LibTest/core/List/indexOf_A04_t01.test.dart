/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int indexOf(E element, [int start = 0])
 * @description Checks that if [start] is not specified, searches the entire
 * list.
 * @author varlax
 */
library indexOf_A04_t01;

import "../../../Utils/expect.dart";

checkList(List list, var elem, int expected) {
  Expect.equals(expected, list.indexOf(elem));
}

check(List ls) {
  checkList(ls, 42, 0);
  checkList(ls, 777, -1);
  checkList(ls, null, -1);
  checkList(ls, 0, 1);
  checkList(ls, 6031769, 5);
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

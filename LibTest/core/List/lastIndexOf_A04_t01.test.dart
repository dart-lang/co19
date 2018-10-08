/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int lastIndexOf(E element, [int start])
 * If start is not provided, it defaults to this.length - 1.
 * @description Checks searching w/o start.
 * @author varlax
 */
library lastIndexOf_A04_t01;

import "../../../Utils/expect.dart";

checkList(List list, var elem, int expected) {
  Expect.equals(expected, list.lastIndexOf(elem));
}

check(List ls) {
  checkList(ls, 42, 3);
  checkList(ls, 777, -1);
  checkList(ls, null, -1);
  checkList(ls, 0, 6);
  checkList(ls, 6031769, 5);
}

test(List create([int length])) {
  List a = create();
  a.addAll(const [42, 0, -1, 42, -1, 6031769, 0]);
  check(a);

  List b = create(a.length);
  b.setRange(0, a.length, a);
  check(b);
}

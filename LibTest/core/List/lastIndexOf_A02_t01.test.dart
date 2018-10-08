/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int lastIndexOf(E element, [int start])
 * Returns -1 if element is not found.
 * @description Checks that -1 is returned if the element is not present in
 * the list.
 * @author iefremov
 */
library lastIndexOf_A02_t01;

import "../../../Utils/expect.dart";

void check(List a) {
  Expect.isTrue(a.lastIndexOf(3.14, 0) == -1);
  Expect.isTrue(a.lastIndexOf(null, 0) == -1);
  Expect.isTrue(a.lastIndexOf(a, 0) == -1);
  Expect.isTrue(a.lastIndexOf(-1, 1) == -1);
  Expect.isTrue(a.lastIndexOf(6031769, 4) == -1);
}

test(List create([int length])) {
  List a = create();
  a.addAll(const [42, 0, -1, 42, -1, 6031769, 0]);
  check(a);

  List b = create(a.length);
  b.setRange(0, a.length, a);
  check(b);
}

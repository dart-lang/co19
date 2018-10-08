/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeLast()
 * Pops and returns the last element of the list.
 * @description Checks that the last element of the list is returned.
 * @author vasya
 */
library removeLast_A01_t01;

import "../../../Utils/expect.dart";

check(a) {
  Expect.isTrue(a.length == 0);
  a.add(null);
  Expect.isTrue(a.length == 1);
  Object o = a.removeLast();
  Expect.isTrue(a.length == 0 && o == null);

  a.add(1);
  Expect.isTrue(a.length == 1);
  o = a.removeLast();
  Expect.isTrue(a.length == 0 && o == 1);

  a.add("1");
  Expect.isTrue(a.length == 1);
  o = a.removeLast();
  Expect.isTrue(a.length == 0 && o == "1");

  a.add(false);
  Expect.isTrue(a.length == 1);
  o = a.removeLast();
  Expect.isTrue(a.length == 0 && o == false);

  List b = new List(100);
  b[99] = "removeLast";
  a.addAll(b);
  Expect.isTrue(a.length == 100);
  o = a.removeLast();
  Expect.isTrue(a.length == 99 && o == b[99]);
}

test(List create([int length])) {
  check(create());
}

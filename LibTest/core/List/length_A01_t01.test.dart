/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void set length(int newLength)
 * Changes the length of the list.
 * If newLength is greater than the current length, entries are initialized to null.
 * Throws an UnsupportedError if the list is not extendable.
 * @description Checks that the length can be changed if list is growable.
 * @author vasya
 */
library length_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create();
  a.length = 100;
  a[99] = 1;
  Expect.isTrue(a.length == 100 && a[99] == 1);

  a.length = 0;
  Expect.isTrue(a.length == 0);

  a.length = 1000001;
  a[1000000] = 1;
  Expect.isTrue(a.length == 1000001 && a[1000000] == 1);

  a.length = 1;
  a[0] = 1;
  Expect.isTrue(a.length == 1 && a[0] == 1);
}

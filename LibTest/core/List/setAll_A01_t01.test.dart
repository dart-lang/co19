/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * Overwrites objects of this with the objects of iterable, starting at position
 * index in this list.
 * @description Checks that this method overwrites objects of this with the
 * objects of iterable, starting at position index in this list.
 * @author sgrekhov@unipro.ru
 */
library setAll_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List lst = create(5);
  lst.setAll(0, [1, 2, 3, 4, 5]);
  for (int i = 1; i <= lst.length; i++) {
    Expect.equals(i, lst[i - 1]);
  }

  lst.setAll(2, [30, 40, 50]);
  Expect.equals(1, lst[0]);
  Expect.equals(2, lst[1]);
  Expect.equals(30, lst[2]);
  Expect.equals(40, lst[3]);
  Expect.equals(50, lst[4]);
}

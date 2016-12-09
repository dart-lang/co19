/*
 * Copyright (c) 2011-2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(E value)
 * Adds [value] at the end of the list, extending the length by one.
 * @description Checks extendable lists, that [value] is added to the end of the
 * list and the length is extended by one.
 * @author kaigorodov
 */
library add_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List b = create();
  b.add(null);
  Expect.isNull(b[0]);
  for (var i = 1; i <= 314; i++) {
    b.add(i);
    Expect.equals(i, b[i]);
    Expect.equals(i+1, b.length);
  }
}

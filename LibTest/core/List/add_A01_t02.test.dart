/*
 * Copyright (c) 2011-2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(E value)
 * Adds [value] at the end of the list, extending the length by one.
 * @description Checks that method does not affect the existing content of the
 * list
 * @author kaigorodov
 */
library add_A01_t02;
 
import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create();
  Expect.isTrue(a.length == 0);
  a.add(null);
  Expect.listEquals([null], a);
  a.add(0);
  Expect.listEquals([null, 0], a);
  a.add("1");
  Expect.listEquals([null, 0, "1"], a);
}

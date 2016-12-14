/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void operator []=(int index, E value)
 * Sets the value at the given index in the list to value.
 * @description Checks that needed element is correctly assigned in extendable
 * lists.
 * @author kaigorodov
 */
library operator_subscripted_assignment_A01_t02;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List from(List content) {
    List res = create(content.length);
    res.setRange(0, content.length, content);
    return res;
  }
  
  List a = from([0]);
  a[0] = 1;
  Expect.identical(1, a[0]);
  a[0] = null;
  Expect.isTrue(null == a[0]);
  a[0] = a;
  Expect.identical(a, a[0]);

  a = from([1, 2, 3]);
  a[1] = null;
  Expect.listEquals([1, null, 3], a);
  a[2] = null;
  Expect.listEquals([1, null, null], a);
  a[0] = null;
  Expect.listEquals([null, null, null], a);
  a[1] = 100500;
  Expect.listEquals([null, 100500, null], a);
}

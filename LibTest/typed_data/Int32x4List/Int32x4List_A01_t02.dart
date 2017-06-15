/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4List(int length)
 * Creates a Int32x4List of the specified length (in elements), all of whose
 * elements are initially zero.
 * @description Checks that all elements of the new Int32x4List are zero.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(length) {
  var l = new Int32x4List(length);
  for (int i = 0; i < length; ++i) {
    Expect.isTrue(equal(new Int32x4(0, 0, 0, 0), l[i]));
  }
}

main() {
  check(1);
  check(10);
  check(1024);
  check(2048);
}

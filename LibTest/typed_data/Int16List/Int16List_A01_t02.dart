/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int16List(int length)
 * Creates an [Int16List] of the specified length (in elements), all of
 * whose elements are initially zero.
 * @description Checks that all elements of the new [Int16List] are zero.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  Int16List l = new Int16List(length);
  for (int i = 0; i < length; ++i) {
    Expect.equals(l[i], 0);
  }
}

main() {
  check(1);
  check(10);
  check(1024);
  check(2048);
}

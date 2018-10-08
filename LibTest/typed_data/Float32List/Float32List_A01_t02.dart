/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32List(int length)
 * Creates an [Float32List] of the specified length (in elements), all of
 * whose elements are initially zero.
 * @description Checks that all elements of the new [Float32List] are zero.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  Float32List l = new Float32List(length);
  for (int i = 0; i < length; ++i) {
    Expect.equals(0.0, l[i]);
  }
}

main() {
  check(1);
  check(10);
  check(1024);
  check(2048);
}

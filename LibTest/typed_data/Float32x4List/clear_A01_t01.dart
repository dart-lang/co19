/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void clear()
 * Removes all elements in the list; the length of the list becomes zero.
 * Throws an [UnsupportedError], and retains all elements, if this is a
 * fixed-length list.
 * @description Checks that [UnsupportedError] is thrown since [Float32x4List]
 * is a fixed-size list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(int length) {
  Float32x4List l = new Float32x4List(length);
  try {
    l.clear();
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {}
  Expect.equals(length, l.length);
}

main() {
  check(0);
  check(1);
  check(100);
  check(2048);
}

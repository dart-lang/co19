/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(E value)
 * Adds value at the end of the list, extending the length by one.
 * Throws an [UnsupportedError] if the list is fixed-length.
 * @description Checks that [UnsupportedError] is thrown since [Float32List] is
 * a fixed-size list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(length) {
  var l = new Float32List(length);
  try {
    l.add(0.0);
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

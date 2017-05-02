/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void length=(int newLength)
 * Changes the length of the list.
 * Throws an UnsupportedError if the list is not extendable.
 * @description Checks that [UnsupportedError] is thrown since [Float32x4List]
 * is a fixed-size list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

void check(List<Float32x4> array, int length) {
  var l = new Float32x4List.fromList(array);
  try {
    l.length = 1;
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {}
  Expect.equals(length, l.length);
}

main() {
  check([], 0);
  check([pack(1.0)], 1);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)], 5);
}

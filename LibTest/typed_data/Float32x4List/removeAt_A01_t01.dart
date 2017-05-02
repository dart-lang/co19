/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E removeAt(int index)
 * Removes the object at position index from the list.
 * This method reduces the length of this by one and moves all later objects
 * down by one position.
 * Returns the removed object.
 * The index must be in the range 0 ≤ index < length.
 * Throws an UnsupportedError if this is a fixed-length list.
 * @description Checks that [UnsupportedError] is thrown
 * since [Float32x4List] is a fixed-size list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  Float32x4List l = new Float32x4List.fromList(list);
  var length = l.length;
  try {
    l.removeAt(0);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([pack(1.0)]);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
}

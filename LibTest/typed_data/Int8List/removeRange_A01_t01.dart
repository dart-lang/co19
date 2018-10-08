/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeRange(int start, int end)
 * Removes the objects in the range start inclusive to end exclusive.
 * ...
 * Throws an UnsupportedError if this is a fixed-length list.
 * @description Checks that [UnsupportedError] is thrown since [Int8List] is a
 * fixed-length list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int8List.fromList(list);
  var length = l.length;
  try {
    l.removeRange(0, 1);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}

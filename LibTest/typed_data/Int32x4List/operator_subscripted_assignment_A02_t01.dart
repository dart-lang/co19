/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, E value)
 * ... or throws a RangeError if index is out of bounds.
 * @description Checks that a RangeError is thrown if index is out of bounds.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

void check(list) {
  var l = new Int32x4List.fromList(list);
  try {
    l[-1] = i32x4(11);
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[l.length] = i32x4(12);
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  check([i32x4(1)]);
  check([i32x4(10), i32x4(11), i32x4(12), i32x4(13)]);
  check([
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ]);
}

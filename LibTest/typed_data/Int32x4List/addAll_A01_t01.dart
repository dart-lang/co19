/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> iterable)
 * Appends all objects of iterable to the end of this list.
 * ...
 * Throws an UnsupportedError if the list is fixed-length.
 * @description Checks that an UnsupportedError is thrown as the Int32x4List is
 * a fixed-length list.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

void check(list) {
  var l = new Int32x4List.fromList(list);
  try {
    l.addAll([i32x4(100), i32x4(101), i32x4(102)]);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
}

main() {
  check([i32x4(1)]);
  check([i32x4(10), i32x4(11), i32x4(12), i32x4(13)]);
  check([
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ]);
}

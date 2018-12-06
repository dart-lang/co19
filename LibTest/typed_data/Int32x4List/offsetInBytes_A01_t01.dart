/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int offsetInBytes
 * Returns the offset in bytes into the underlying byte buffer of this view.
 * @description Checks that returned offsetInBytes is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

void check(List<Int32x4> list) {
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  for (int i = 0; i < l.length; ++i) {
    var view = new Int32x4List.view(buffer, i * Int32x4List.bytesPerElement);
    Expect.equals(i * Int32x4List.bytesPerElement, view.offsetInBytes);
  }
}

main() {
  check([]);
  check([i32x4(1)]);
  check([i32x4(10), i32x4(11), i32x4(12), i32x4(13)]);
  check([
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ]);
}

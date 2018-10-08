/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * ...
 * An error occurs if start is outside the range 0 .. length or if end is
 * outside the range start .. length.
 * @description Checks that an error occurs if start is outside the range
 * 0 .. length
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  Expect.throws(() {
    l.sublist(-1);
  });

  Expect.throws(() {
    l.sublist(l.length + 1);
  });
}

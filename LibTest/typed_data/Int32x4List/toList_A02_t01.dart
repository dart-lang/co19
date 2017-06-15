/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * ...
 * The list is fixed-length if growable is false.
 * @description Checks that the returned list is fixed-length if growable is
 * false.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);
  var res = l.toList(growable: false);

  try {
    res.length = 10;
    Expect.fail("List must be fixed-length");
  } on UnsupportedError {}

  Expect.equals(l.length, res.length);
}

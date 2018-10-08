/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * ...
 * The iterable must have at least one element.
 * @description Checks that an error is thrown if iterable is empty.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

main() {
  var l = new Int32x4List.fromList([]);
  Expect.throws(() {
    l.reduce((prev, cur) => i32x4p(11));
  });
}

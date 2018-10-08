/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them
 * make test return true, otherwise returns false.
 * @description Checks that true is returned, if any element in this list
 * satisfies test, and false otherwise.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var l = new Int32x4List.fromList(
      [i32x4(10), i32x4(11), i32x4(12), i32x4(13)]);
  Expect.isTrue(l.any((e) => e.x > 12));
  Expect.isFalse(l.any((e) => e.x < 10));

  l = new Int32x4List.fromList(
      [i32x4(10), i32x4(11), i32x4(11), i32x4(13)]);
  Expect.isTrue(l.any((e) => e.x == 11));
  Expect.isFalse(l.any((e) => e.x == 12));
}

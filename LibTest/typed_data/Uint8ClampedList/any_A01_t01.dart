/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them make
 * test return true, otherwise returns false.
 * @description Checks that true is returned if one or more elements satisfies
 * the predicate f, false otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool pred(int element) => element > 5;

main() {
  var l;
  l = new Uint8ClampedList.fromList([]);
  Expect.isFalse(l.any(pred));

  l = new Uint8ClampedList.fromList([1]);
  Expect.isFalse(l.any(pred));

  l = new Uint8ClampedList.fromList([1, 2, 3, 4, 5, 1, 2, 3, 4, 5]);
  Expect.isFalse(l.any(pred));

  l = new Uint8ClampedList.fromList([100]);
  Expect.isTrue(l.any(pred));

  l = new Uint8ClampedList.fromList([6, 7, 8, 9, 10]);
  Expect.isTrue(l.any(pred));

  l = new Uint8ClampedList.fromList([1, 2, 3, 6, 4, 5]);
  Expect.isTrue(l.any(pred));
}

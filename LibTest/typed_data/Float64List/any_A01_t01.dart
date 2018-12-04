/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them
 * make [test] return true, otherwise returns false.
 * @description Checks that true is returned if one or more elements satisfies
 * the predicate f, false otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool pred(double element) => element > 5.0;

main() {
  var l;
  l = new Float64List.fromList([]);
  Expect.isFalse(l.any(pred));

  l = new Float64List.fromList([1.0]);
  Expect.isFalse(l.any(pred));

  l = new Float64List.fromList(
      [1.0, 2.0, 3.0, 4.0, 5.0, 1.0, 2.0, 3.0, 4.0, 5.0]);
  Expect.isFalse(l.any(pred));

  l = new Float64List.fromList([100.0]);
  Expect.isTrue(l.any(pred));

  l = new Float64List.fromList([6.0, 7.0, 8.0, 9.0, 10.0]);
  Expect.isTrue(l.any(pred));

  l = new Float64List.fromList([1.0, 2.0, 3.0, 6.0, 4.0, 5.0]);
  Expect.isTrue(l.any(pred));
}

/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @descriptionCheck that true is returned only if every element of the list
 * satisfies the predicate [f].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool pred(double element) => element > 5.0;

main() {
  var l;
  l = new Float32List.fromList([]);
  Expect.isTrue(l.every(pred));

  l = new Float32List.fromList([1.0]);
  Expect.isFalse(l.every(pred));

  l = new Float32List.fromList(
      [1.0, 2.0, 3.0, 4.0, 5.0, 1.0, 2.0, 3.0, 4.0, 5.0]);
  Expect.isFalse(l.every(pred));

  l = new Float32List.fromList([2.123e13]);
  Expect.isTrue(l.every(pred));

  l = new Float32List.fromList([6.0, 7.0, 8.0, 9.0, 10.0]);
  Expect.isTrue(l.every(pred));

  l = new Float32List.fromList([6.0, 7.0, 8.0, 9.0, 10.65e-20]);
  Expect.isFalse(l.every(pred));
}

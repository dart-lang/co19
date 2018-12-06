/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool test(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make [test] return false, otherwise returns true.
 * @descriptionCheck that true is returned only if every element of the list
 * satisfies the predicate [test].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

bool pred(int element) => element > 5;

main() {
  var l;
  l = new Uint16List.fromList([]);
  Expect.isTrue(l.every(pred));

  l = new Uint16List.fromList([1]);
  Expect.isFalse(l.every(pred));

  l = new Uint16List.fromList([1, 2, 3, 4, 5, 1, 2, 3, 4, 5]);
  Expect.isFalse(l.every(pred));

  l = new Uint16List.fromList([100]);
  Expect.isTrue(l.every(pred));

  l = new Uint16List.fromList([6, 7, 8, 9, 10]);
  Expect.isTrue(l.every(pred));

  l = new Uint16List.fromList([6, 7, 8, 9, 1]);
  Expect.isFalse(l.every(pred));
}

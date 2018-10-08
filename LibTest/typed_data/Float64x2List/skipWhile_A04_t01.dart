/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where test(element) returns true. If all
 * elements satisfy test the resulting iterable is empty, otherwise it iterates
 * the remaining elements in their original order, starting with the first
 * element for which test(element) returns false.
 * @description Checks that if not all elements satisfy the test, the returned
 * iterable iterates the remaining elements in their original order, starting
 * with the first element for which test(element) returns false. If all elements
 * satisfy test the resulting iterable is empty.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  Float64x2List l = new Float64x2List.fromList(
      [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(1.0), f64x2(2.0)]);

  var res = l.skipWhile((e) => e.x < 3.0);
  for (int i = 0; i < 3; ++i) {
    Expect.isTrue(l[i + 2].x == res.elementAt(i).x &&
        l[i + 2].y == res.elementAt(i).y);
  }

  res = l.skipWhile((e) => e.x < 4.0);
  Expect.isTrue(res.isEmpty);
}

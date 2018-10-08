/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * Returns a new lazy Iterable with all elements that satisfy the predicate
 * test.
 * The matching elements have the same order in the returned iterable as they
 * have in iterator.
 * @description Checks that the returned Iterable is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, bool test(Float64x2 e)) {
  var l = new Float64x2List.fromList(list);
  var res = l.where(test);
  var counter = 0;

  for (int i = 0; i < l.length; ++i) {
    if (test(l[i])) {
      Expect.equals(l[i].x, res.elementAt(counter).x);
      Expect.equals(l[i].y, res.elementAt(counter).y);
      counter++;
    }
  }
  Expect.equals(counter, res.length);
}

main() {
  check([], (e) => true);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)],
      (e) => e.x < 4.0);
  check(
      [f64x2(1.0), f64x2(2.0), f64x2(2.0), f64x2(4.0), f64x2(5.0), f64x2(5.0)],
      (e) => e.x > 3.0);
}

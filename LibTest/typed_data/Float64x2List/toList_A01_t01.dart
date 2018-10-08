/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements are in iteration order.
 * @description Checks that the returned list is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void checkLists(Float64x2List l1, List<Float64x2> l2) {
  Expect.equals(l1.length, l2.length);
  for (int i = 0; i < l1.length; ++i) {
    Expect.equals(l1[i].x, l2[i].x);
    Expect.equals(l1[i].y, l2[i].y);
  }
}

check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  var res = l.toList();
  checkLists(l, res);

  res = l.toList(growable: true);
  checkLists(l, res);

  res = l.toList(growable: false);
  checkLists(l, res);
}

main() {
  check([]);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)]);
  check(
      [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)]);
}

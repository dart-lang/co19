/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a Set containing the same elements as this iterable.
 * The set may contain fewer elements than the iterable, if the iterable
 * contains an element more than once, or it contains one or more elements that
 * are equal. The order of the elements in the set is not guaranteed to be the
 * same as for the iterable.
 * @description Checks that the returned set is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  var res = l.toSet();

  Expect.equals(l.length, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(res.any((e) => l[i].x == e.x));
    Expect.isTrue(res.any((e) => l[i].y == e.y));
  }
}

main() {
  check([]);
  check(
      [f64x2(6.0), f64x2(1.0), f64x2(4.0), f64x2(2.0), f64x2(5.0), f64x2(3.0)]);
  check(
      [f64x2(1.0), f64x2(2.0), f64x2(2.0), f64x2(4.0), f64x2(5.0), f64x2(5.0)]);
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Returns an Iterable that skips leading elements while test is satisfied.
 * @description Checks that the returned Iterable is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, bool test(Float64x2 e), int n) {
  var l = new Float64x2List.fromList(list);
  var res = l.skipWhile(test);
  for (int i = 0; i < res.length; ++i) {
    Expect.isTrue(l[i + n].x == res.elementAt(i).x &&
        l[i + n].y == res.elementAt(i).y);
  }
}

main() {
  List<Float64x2> list = [
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0),
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ];

  check(list, (e) => e.x < 5.0, 4);
  check(list, (e) => e.x == 5.0, 0);
  check(list, (e) => e.x > 5.0, 0);
  check(list, (e) => true, 9);
  check(list, (e) => false, 0);
}

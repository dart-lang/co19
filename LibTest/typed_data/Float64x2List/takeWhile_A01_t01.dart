/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Returns a lazy iterable of the leading elements satisfying test.
 * @description Checks that an iterable of the leading elements satisfying test
 * is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, bool test(Float64x2 e)) {
  var l = new Float64x2List.fromList(list);
  var res = l.takeWhile(test);
  var it = res.iterator;
  var counter1 = 0;
  while (it.moveNext()) {
    Expect.equals(l[counter1].x, res.elementAt(counter1).x);
    Expect.equals(l[counter1].y, res.elementAt(counter1).y);
    counter1++;
  }
  var counter2 = 0;
  Expect.equals(counter1, res.length);
  for (int i = counter1; i < l.length; ++i) {
    counter2++;
  }
  Expect.equals(counter1 + counter2, l.length);
}

main() {
  List<Float64x2> list = [
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)
  ];
  check(list, (e) => e.x == 1.0);
  check(list, (e) => true);
  check(list, (e) => false);
  check(list, (e) => e.x < 3.0);
  check(list, (e) => e.x == 3.0);
  check(list, (e) => e.x > 3.0);
}

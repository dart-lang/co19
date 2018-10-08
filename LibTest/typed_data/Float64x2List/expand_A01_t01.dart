/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> expand<T>(Iterable<T> f(E element))
 * Expands each element of this Iterable into zero or more elements.
 * The resulting Iterable runs through the elements returned by f for each
 * element of this, in iteration order.
 * @description Checks that returned Iterable contains correct values.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  var l = new Float64x2List.fromList(list);
  var res = l.expand((element) => [element + element]);
  Expect.equals(list.length, res.length);
  for (int i = 0; i < list.length; ++i) {
    Expect.equals(l[i].x + l[i].x, res.elementAt(i).x);
    Expect.equals(l[i].y + l[i].y, res.elementAt(i).y);
  }

  res = l.expand((element) => [element, element * f64x2(2.0)]);
  Expect.equals(list.length * 2, res.length);
  for (int i = 0; i < list.length; ++i) {
    Expect.equals(l[i].x, res.elementAt(i * 2).x);
    Expect.equals(l[i].y, res.elementAt(i * 2).y);
    Expect.equals(l[i].x * 2, res.elementAt(i * 2 + 1).x);
    Expect.equals(l[i].y * 2, res.elementAt(i * 2 + 1).y);
  }

  res = l.expand((element) => []);
  Expect.equals(0, res.length);
}

main() {
  check([]);
  check([f64x2(1.0)]);
  check([f64x2(1.0), f64x2(1.0)]);
  check([
    f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0),
    f64x2(10.0), f64x2(11.0), f64x2(12.0), f64x2(13.0), f64x2(14.0),
    f64x2(15.0), f64x2(16.0), f64x2(17.0)
  ]);
}

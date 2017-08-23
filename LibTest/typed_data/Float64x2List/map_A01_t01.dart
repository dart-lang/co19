/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * Returns a new lazy Iterable with elements that are created by calling f on
 * each element of this Iterable in iteration order.
 * @description Checks that the correct Iterable is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2(v, v + 1);

main() {
  var l = new Float64x2List.fromList(
      [f64x2(5.0), f64x2(7.0), f64x2(9.0), f64x2(11.0)]
  );
  dynamic res = l.map((e) => e.x + e.y);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x + l[i].y, res.elementAt(i));
  }

  res = l.map((e) => e.y);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].y, res.elementAt(i));
  }

  res = l.map((e) => 1);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(1, res.elementAt(i));
  }

  l = new Float64x2List.fromList([]);
  res = l.map((e) => e);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x, res.elementAt(i).x);
  }
  Expect.isTrue(res.isEmpty);
}

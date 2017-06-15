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

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(1), i32x4(3), i32x4(4)];
  var l = new Int32x4List.fromList(list);
  var res = l.map((e) => e.x + e.y);
  Expect.equals(l.length, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x + l[i].y, res.elementAt(i));
  }

  res = l.map((e) => 1);
  Expect.equals(l.length, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(1, res.elementAt(i));
  }

  l = new Int32x4List.fromList([]);
  res = l.map((e) => 1);
  Expect.isTrue(res.isEmpty);
}

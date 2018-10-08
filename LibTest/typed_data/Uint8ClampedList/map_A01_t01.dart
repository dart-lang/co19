/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E e))
 * Returns a new lazy [Iterable] with elements that are created by calling f on
 * each element of this Iterable in iteration order.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var m = new Map<int,int>();
  m[1] = 2;
  m[2] = 5;
  m[6] = 9;
  m[10] = 120;
  m[3] = 76;
  m[0] = 0;
  m[8] = 7;
  var l = new Uint8ClampedList.fromList([1, 2, 6, 10, 3, 0, 8]);
  var res = l.map((e) => m[e]);

  for (int i = 0; i < l.length; ++i) {
    Expect.equals(m[l[i]], res.elementAt(i));
  }

  l = new Uint8ClampedList.fromList([]);
  res = l.map((e) => 0);
  Expect.isTrue(res.isEmpty);

  l = new Uint8ClampedList.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  res = l.map((e) => 1 );
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(1, res.elementAt(i));
  }
}

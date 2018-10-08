/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<T>(T f(E element))
 * Returns a new lazy [Iterable] with elements that are created by calling f on
 * each element of this [Iterable] in iteration order.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var m = new Map();
  m[1.0] = 2.0;
  m[2.0] = 5.0;
  m[6.0] = 9.0;
  m[10.0] = 120.0;
  m[3.0] = 76.0;
  m[0.0] = 0.0;
  m[8.0] = 7.0;
  var l = new Float32List.fromList([1.0, 2.0, 6.0, 10.0, 3.0, 0.0, 8.0]);
  var res = l.map((e) => m[e]);

  for (int i = 0; i < l.length; ++i) {
    Expect.equals(m[l[i]], res.elementAt(i));
  }

  l = new Float32List.fromList([]);
  res = l.map((e) => 0.0);
  Expect.isTrue(res.isEmpty);

  l = new Float32List.fromList(
      [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
  res = l.map((e) => 1.0 );
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(1.0, res.elementAt(i));
  }

}

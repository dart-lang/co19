/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<T> map<t>(T f(E e))
 * Returns a new lazy [Iterable] with elements that are created by calling f on
 * each element of this Iterable in iteration order.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

main() {
  var l = new Float32x4List.fromList([
    pack(1.0), pack(2.0), pack(6.0), pack(10.0), pack(3.0), pack(0.0),
    pack(8.0)
  ]);
  var res = l.map((e) => e.x);

  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x, res.elementAt(i));
  }

  l = new Float32x4List.fromList([]);
  res = l.map((e) => 0.0);
  Expect.isTrue(res.isEmpty);

  l = new Float32x4List.fromList([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ]);
  res = l.map((e) => 1.0 );
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(1.0, res.elementAt(i));
  }

}

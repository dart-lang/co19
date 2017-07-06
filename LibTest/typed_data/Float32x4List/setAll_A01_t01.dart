/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * Overwrites objects of this with the objects of [iterable], starting at
 * position [index] in the list.
 * This operation does not increase the length of [this].
 * @description Checks that method overwrites elements correctly.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

listEquals(expected, actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.isTrue(equal(expected[i], actual[i]));
  }
}

main() {
  var l = new Float32x4List(10);

  l.setAll(9, [pack(1.0)]);
  listEquals([
    pack(.0), pack(.0), pack(.0), pack(.0), pack(.0), pack(.0),
    pack(.0), pack(.0), pack(.0), pack(1.0)
  ], l);

  l.setAll(2, [pack(2.0), pack(2.0), pack(2.0), pack(2.0)]);
  listEquals([
    pack(.0), pack(.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0),
    pack(.0), pack(.0), pack(.0), pack(1.0)
  ], l);

  l.setAll(0, [pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(3.0)]);
  listEquals([
    pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(2.0),
    pack(.0), pack(.0), pack(.0), pack(1.0)
  ], l);

  l.setAll(0, [
    pack(11.0), pack(11.0), pack(11.0), pack(11.0), pack(11.0),
    pack(11.0), pack(11.0), pack(11.0), pack(11.0), pack(11.0)
  ]);
  listEquals([
    pack(11.0), pack(11.0), pack(11.0), pack(11.0), pack(11.0),
    pack(11.0), pack(11.0), pack(11.0), pack(11.0), pack(11.0)
  ], l);

  l.setAll(0, []);
  listEquals([
    pack(11.0), pack(11.0), pack(11.0), pack(11.0), pack(11.0),
    pack(11.0), pack(11.0), pack(11.0), pack(11.0), pack(11.0)
  ], l);
}

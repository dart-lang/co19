/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a [List] containing the elements of this [Iterable].
 * The elements will be in iteration order.
 * @description Checks that the returned [List] contains all elements of [this]
 * in the same order.
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

void check(List<Float32x4> list, bool grow) {
  var l = new Float32x4List.fromList(list);
  var res = l.toList(growable:grow);

  Expect.equals(l.length, res.length);
  listEquals(l, res);
}

main() {
  check([], false);
  check([pack(0.0)], true);
  check([pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0)], false);
  check([
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(0.0),
    pack(0.0), pack(0.0), pack(0.0), pack(0.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0),
    pack(2.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0), pack(2.0),
    pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(3.0),
    pack(3.0), pack(3.0), pack(3.0), pack(3.0), pack(4.0), pack(4.0),
    pack(4.0), pack(4.0), pack(4.0), pack(4.0), pack(4.0), pack(4.0),
    pack(4.0), pack(4.0), pack(5.0), pack(5.0), pack(5.0), pack(5.0),
    pack(5.0), pack(5.0), pack(5.0), pack(5.0), pack(5.0), pack(5.0),
    pack(6.0), pack(6.0), pack(6.0), pack(6.0), pack(6.0), pack(6.0),
    pack(6.0), pack(6.0), pack(6.0), pack(6.0), pack(7.0), pack(7.0),
    pack(7.0), pack(7.0), pack(7.0), pack(7.0), pack(7.0), pack(7.0),
    pack(7.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0),
    pack(8.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0), pack(8.0),
    pack(9.0), pack(9.0), pack(9.0), pack(9.0), pack(9.0), pack(9.0),
    pack(9.0), pack(9.0), pack(9.0), pack(9.0)
  ], true);
}

/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * @description Checks that the returned value is correct.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

check(List<Float32x4> list, expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.isTrue(equal(expected, res));
}

checkConst(List<Float32x4> list, expected) {
  Float32x4List l = new Float32x4List.fromList(list);
  var res = l.reduce((prev, cur) => pack(1.0));
  Expect.isTrue(equal(expected, res));
}


main() {
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], pack(55.0));
  check([pack(10.0), pack(-1.0), pack(-2.0), pack(-3.0), pack(-4.0)],
         pack(0.0));

  checkConst([pack(1.0), pack(2.0), pack(3.0)], pack(1.0));
}

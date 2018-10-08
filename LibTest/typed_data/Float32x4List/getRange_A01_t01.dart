/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * Returns an [Iterable] that iterates over the elements in the range [start]
 * inclusive to [end] exclusive.
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

check(List<Float32x4> list, int start, int end) {
  var l = new Float32x4List.fromList(list);
  var res = l.getRange(start, end);
  var it = res.iterator;
  var i = start;
  while (it.moveNext()) {
    Expect.isTrue(equal(l[i++], it.current));
  }
}

main() {
  check([], 0, 0);
  check([pack(1.0)], 0, 1);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 0, 10);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 9, 10);
}

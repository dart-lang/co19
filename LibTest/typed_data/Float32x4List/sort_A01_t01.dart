/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sort([int compare(E a, E b)])
 * Sorts the list according to the order specified by the compare function.
 * @description Checks sorting various integer arrays.
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

void check(List<Float32x4> list, List expected) {
  var actual = new Float32x4List.fromList(list);
  int c(var a, var b) {
    return a.x < b.x ? -1 : (a.x == b.x ? 0 : 1);
  }
  actual.sort(c);
  listEquals(expected, actual);
}

main() {
  check([], []);
  check([pack(1.0)], [pack(1.0)]);
  check([pack(1.0), pack(2.0)], [pack(1.0), pack(2.0)]);
  check([pack(1.0), pack(2.0), pack(4.0), pack(3.0), pack(5.0), pack(6.0)],
      [pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0)]);
  check([pack(2.0), pack(1.0), pack(4.0), pack(3.0), pack(6.0), pack(5.0)],
      [pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0)]);
  check([pack(6.0), pack(5.0), pack(4.0), pack(3.0), pack(2.0), pack(1.0)],
      [pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0)]);
  check([
    pack(9.0), pack(9.0), pack(1.0), pack(2.0), pack(3.0), pack(0.0),
    pack(3.0), pack(2.0), pack(2.0), pack(3.0), pack(4.0), pack(1.0),
    pack(9.0), pack(5.0), pack(7.0), pack(7.0), pack(5.0), pack(6.0),
    pack(1.0), pack(0.0), pack(4.0), pack(8.0), pack(8.0), pack(8.0),
    pack(5.0), pack(4.0), pack(6.0), pack(7.0), pack(6.0), pack(0.0)
  ], [
    pack(0.0), pack(0.0), pack(0.0), pack(1.0), pack(1.0), pack(1.0),
    pack(2.0), pack(2.0), pack(2.0), pack(3.0), pack(3.0), pack(3.0),
    pack(4.0), pack(4.0), pack(4.0), pack(5.0), pack(5.0), pack(5.0),
    pack(6.0), pack(6.0), pack(6.0), pack(7.0), pack(7.0), pack(7.0),
    pack(8.0), pack(8.0), pack(8.0), pack(9.0), pack(9.0), pack(9.0)
  ]);
}

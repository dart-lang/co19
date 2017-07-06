/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * void setRange(
 *     int start,
 *     int end,
 *     Iterable<E> iterable, [
 *     int skipCount = 0
 * ])
 * Copies the objects of [iterable], skipping [skipCount] objects first, into
 * the range [start], inclusive, to end, [exclusive], of the list.
 * @description Checks that the correct range is set with correct elements.
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
  var l = new Float32x4List.fromList([
    pack(.0), pack(.0), pack(.0), pack(.0), pack(.0), pack(.0), pack(.0),
    pack(.0), pack(.0), pack(.0)
  ]);

  l.setRange(1, 2, [pack(1.0), pack(2.0), pack(3.0)], 2);
  listEquals([
    pack(.0), pack(3.0), pack(.0), pack(.0), pack(.0), pack(.0),
    pack(.0), pack(.0), pack(.0), pack(.0)
  ], l);

  l.setRange(3, 5, [pack(1.0), pack(2.0), pack(3.0)], 0);
  listEquals([
    pack(.0), pack(3.0), pack(.0), pack(1.0), pack(2.0), pack(.0),
    pack(.0), pack(.0), pack(.0), pack(.0)
  ], l);

  l.setRange(0, 10, [
    pack(.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0),
    pack(5.0), pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 1);
  listEquals([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], l);
}

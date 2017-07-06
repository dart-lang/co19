/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
 * ...
 * If iterable is this list, the operation copies the elements originally in
 * the range from skipCount to skipCount + (end - start) to the range start to
 * end, even if the two ranges overlap.
 * @description Checks that overlapped ranges a are set correctly.
 * @author ngl@unipro.ru
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
    pack(.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0)
  ]);

  l.setRange(1, 3, l, 2);
  listEquals([
    pack(.0), pack(2.0), pack(3.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0)
  ], l);

  l.setRange(3, 8, l, 0);
  listEquals([
    pack(.0), pack(2.0), pack(3.0), pack(.0), pack(2.0), pack(3.0),
    pack(3.0), pack(4.0), pack(8.0), pack(9.0)
  ], l);
}

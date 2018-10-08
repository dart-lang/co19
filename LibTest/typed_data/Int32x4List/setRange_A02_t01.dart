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
 * The provide range, given by start and end, must be valid. A range from start
 * to end is valid if 0 <= start <= end <= len, where len is this list's length.
 * The range starts at start and has length end - start.
 * @description Checks that the range must be valid.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);
  Expect.throws(() {
    l.setRange(-1, 3, [i32x4(11), i32x4(12)]);
  });
  Expect.equals(list.length, l.length);

  Expect.throws(() {
    l.setRange(4, -6, [i32x4(1), i32x4(0), i32x4(0), i32x4(1)], 1);
  });
  Expect.equals(list.length, l.length);

  Expect.throws(() {
    l.setRange(7, 7, [i32x4(1), i32x4(1), i32x4(1), i32x4(1)]);
  });
  Expect.equals(list.length, l.length);

  Expect.throws(() {
    l.setRange(3, 7, [i32x4(1), i32x4(2), i32x4(3)], 2);
  });
  Expect.equals(list.length, l.length);

  Expect.throws(() {
    l.setRange(3, 1, []);
  });
  Expect.equals(list.length, l.length);
}

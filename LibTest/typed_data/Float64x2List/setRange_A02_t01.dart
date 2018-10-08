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
 * @description Checks that the provided range should be valid.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List(9);

  Expect.throws(() {
    l.setRange(-1, 5, [
      f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0),
      f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
    ]);
  });

  Expect.throws(() {
    l.setRange(3, 2, [
      f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0),
      f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
    ]);
  });

  Expect.throws(() {
    l.setRange(10, 2, [
      f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0),
      f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
    ]);
  });

  Expect.throws(() {
    l.setRange(3, -1, [
      f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0),
      f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
    ]);
  });

  Expect.throws(() {
    l.setRange(3, 10, [
      f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0),
      f64x2(5.0), f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
    ]);
  });
}

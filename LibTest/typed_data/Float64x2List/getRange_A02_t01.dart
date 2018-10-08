/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * ...
 * The provide range, given by start and end, must be valid at the time of the
 * call.
 * A range from start to end is valid if 0 <= start <= end <= len, where len is
 * this list's length. The range starts at start and has length end - start.
 * An empty range (with end == start) is valid.
 * @description Checks that the range from start to end should be valid.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list, int start, int end) {
  var l = new Float64x2List.fromList(list);
  Expect.throws(() {
    l.getRange(start, end);
  });
}

main() {
  check([], -1, 0);
  check([f64x2(1.0)], 0, -1);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)], 6, 5);
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)], 2, 6);
}

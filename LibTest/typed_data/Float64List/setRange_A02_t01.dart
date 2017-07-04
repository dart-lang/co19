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
 * ...
 * The provide range, given by [start] and [end], must be valid. A range from
 * [start] to [end] is valid if 0 <= start <= end <= len, where len is this
 * list's length. The range starts at start and has length end - start. An empty
 * range  (with end == start) is valid.
 * legal range, this method has no effect.
 * @description Checks that the method has no effect if [end] equals [start].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List.fromList(
      [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);

  l.setRange(1, 1, [1.0, 2.0, 3.0], 2);
  Expect.listEquals([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], l);

  l.setRange(0, 0, [1.0, 2.0, 3.0], 0);
  Expect.listEquals([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], l);

  l.setRange(10, 10, [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0],
      1);
  Expect.listEquals([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], l);
}

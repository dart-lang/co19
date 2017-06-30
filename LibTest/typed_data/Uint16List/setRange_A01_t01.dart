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
 * the range [start], inclusive, to [end], exclusive, of the list.
 * @description Checks that the correct range is set with correct elements.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint16List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  l.setRange(1, 2, [1, 2, 3], 2);
  Expect.listEquals([0, 3, 0, 0, 0, 0, 0, 0, 0, 0], l);

  l.setRange(3, 5, [1, 2, 3], 0);
  Expect.listEquals([0, 3, 0, 1, 2, 0, 0, 0, 0, 0], l);

  l.setRange(0, 10, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1);
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], l);
}

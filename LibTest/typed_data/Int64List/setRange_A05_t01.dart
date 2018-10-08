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
 * @description Checks that the correct range is set with correct elements.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int64List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

  l.setRange(1, 3, l.getRange(2, 6), 2);
  Expect.listEquals([0, 4, 5, 3, 4, 5, 6, 7, 8, 9], l);

  l.setRange(3, 5, l.getRange(3, 6), 1);
  Expect.listEquals([0, 4, 5, 4, 5, 5, 6, 7, 8, 9], l);

  l.setRange(2, 6, l.getRange(4, 8), 0);
  Expect.listEquals([0, 4, 5, 5, 6, 7, 6, 7, 8, 9], l);
}

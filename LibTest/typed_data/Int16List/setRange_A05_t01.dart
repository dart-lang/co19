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
 * @description Checks that the correct range is set with correct elements,
 * even if the two ranges overlap.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int16List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

  l.setRange(1, 2, l, 2);
  Expect.listEquals([0, 2, 2, 3, 4, 5, 6, 7, 8, 9], l);

  l.setRange(3, 5, l, 0);
  Expect.listEquals([0, 2, 2, 0, 2, 5, 6, 7, 8, 9], l);

  l.setRange(5, 10, l, 3);
  Expect.listEquals([0, 2, 2, 0, 2, 0, 2, 5, 6, 7], l);
}

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
 * @description Checks that the overlaped regions are copied correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,]);

  l.setRange(1, 3, l, 2);
  Expect.listEquals([0.0, 2.0, 3.0, 3.0, 4.0, 5.0, 6.0, 7.0], l);

  l.setRange(4, 7, l, 3);
  Expect.listEquals([0.0, 2.0, 3.0, 3.0, 3.0, 4.0, 5.0, 7.0], l);

}

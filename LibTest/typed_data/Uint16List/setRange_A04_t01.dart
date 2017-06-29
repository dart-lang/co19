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
 * The [iterable] must have enough objects to fill the range from [start] to
 * [end] after skipping [skipCount] objects.
 * @description Checks that it is an error if the [iterable] does not have
 * enough elements after skipping [skipCount] elements.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint16List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  Expect.throws(() {
    l.setRange(0, 1, [], 0);
  });

  Expect.throws(() {
    l.setRange(0, 1, [1, 2], 2);
  });

  Expect.throws(() {
    l.setRange(0, 10, [1, 2, 3, 4], 0);
  });

  Expect.throws(() {
    l.setRange(0, 5, [1, 2, 3, 4, 5], 1);
  });
}

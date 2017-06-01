/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> getRange(int start, int end)
 * ...
 * The provide range, given by start and end, must be valid at the time of the
 * call.
 * A range from start to end is valid if 0 <= start <= end <= len, where len is
 * this list's length.
 * @description Checks that an error is thrown f the start and end are not
 * valid ranges.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int32List.fromList(list);
  Expect.throws(() {
    l.getRange(-1, list.length);
  });

  Expect.throws(() {
    l.getRange(0, list.length + 1);
  });

  Expect.throws(() {
    l.getRange(-1, list.length + 1);
  });

  Expect.throws(() {
    l.getRange(0x80000000, 0x7fffffff);
  });
}

main() {
  check([]);
  check([1]);
  check([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
}

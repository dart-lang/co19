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
 * @description Checks that an error is thrown if the range isn't valid.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(List<Int32x4> list, int start, int end) {
  var l = new Int32x4List.fromList(list);
  var res = l.getRange(start, end);
  var it = res.iterator;
  var i = start;
  while (it.moveNext()) {
    Expect.isTrue(equal(l[i++], it.current));
  }
}

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  Expect.throws(() {
    l.getRange(-1, 2);
  });

  Expect.throws(() {
    l.getRange(1, -1);
  });

  Expect.throws(() {
    l.getRange(9, 6);
  });

  Expect.throws(() {
    l.getRange(4, 7);
  });
}

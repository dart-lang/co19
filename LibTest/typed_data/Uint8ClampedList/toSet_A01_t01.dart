/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a [Set] containing the elements of this [Iterable].
 * @description Checks that the returned [Set] contains all elements of [this].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, int uniqueNum) {
  var l = new Uint8ClampedList.fromList(list);
  var res = l.toSet();

  Expect.equals(uniqueNum, res.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(res.contains(l[i]));
  }
}

main() {
  check([], 0);
  check([0], 1);
  check([0, 0, 0, 0, 0], 1);
  check([
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
  ], 10);
}

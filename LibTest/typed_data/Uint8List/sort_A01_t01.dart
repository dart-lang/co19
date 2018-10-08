/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sort([int compare(E a, E b)])
 * Sorts this list according to the order specified by the compare function.
 * @description Checks sorting various integer arrays.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, List<int> expected) {
  var actual = new Uint8List.fromList(list);
  int c(var a, var b) {
    return a < b ? -1 : (a == b ? 0 : 1);
  }
  actual.sort(c);
  Expect.listEquals(expected, actual);
}

main() {
  check([], []);
  check([1], [1]);
  check([1, 2], [1, 2]);
  check([1, 2, 4, 3, 5, 6], [1, 2, 3, 4, 5, 6]);
  check([2, 1, 4, 3, 6, 5], [1, 2, 3, 4, 5, 6]);
  check([6, 5, 4, 3, 2, 1], [1, 2, 3, 4, 5, 6]);
  check([
    9, 9, 1, 2, 3, 0, 3, 2, 2, 3, 4, 1, 9, 5, 7, 7, 5, 6, 1, 0, 4, 8, 8, 8, 5,
    4, 6, 7, 6, 0
  ], [
    0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8,
    8, 8, 9, 9, 9
  ]);
}

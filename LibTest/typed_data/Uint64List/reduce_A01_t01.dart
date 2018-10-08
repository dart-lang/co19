/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * @description Checks that the returned value is correct.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list, int expected) {
  var l = new Uint64List.fromList(list);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.equals(expected, res);
}

checkConst(List<int> list, int expected) {
  var l = new Uint64List.fromList(list);
  var res = l.reduce((prev, cur) => 1);
  Expect.equals(expected, res);
}

main() {
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 55);
  check([10, 1, 2, 3, 4], 20);

  checkConst([1, 2, 3], 1);
}

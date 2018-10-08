/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * ...
 * If it has only one element, that element is returned.
 * @description Checks that the returned value is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(list, expected) {
  var l = new Int32x4List.fromList(list);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.isTrue(equal(expected, res));
}

void checkConst(list, expected) {
  var l = new Int32x4List.fromList(list);
  var res = l.reduce((prev, cur) => i32x4p(1));
  Expect.isTrue(equal(expected, res));
}

main() {
  check([i32x4p(1)], i32x4p(1));
  check([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)],
      new Int32x4(28, 32, 36, 40));

  checkConst([i32x4p(2)], i32x4p(2));
  checkConst([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)], i32x4p(1));
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * ...
 * Each time iterator is read, it returns a new iterator, which can be used to
 * iterate through all the elements again.
 * @description Checks that each new iterator can be used to iterate this list
 * through all the elements again.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(list) {
  var l = new Int32x4List.fromList(list);
  var it1 = l.iterator;
  var i = 0;
  while (it1.moveNext()) {
    Expect.isTrue(equal(l[i++], it1.current));
  }
  Expect.equals(l.length, i);
  var it2 = l.iterator;
  Expect.notEquals(it1, it2);
  var j = 0;
  while (it2.moveNext()) {
    Expect.isTrue(equal(l[j++], it2.current));
  }
  Expect.equals(l.length, j);
}

main() {
  check([i32x4p(1)]);
  check([i32x4p(1), i32x4p(5), i32x4p(9), i32x4p(13)]);
  check([
    i32x4p(0), i32x4p(1), i32x4p(2), i32x4p(3), i32x4p(4), i32x4p(5), i32x4p(6),
    i32x4p(7),i32x4p(8), i32x4p(9)
  ]);
}

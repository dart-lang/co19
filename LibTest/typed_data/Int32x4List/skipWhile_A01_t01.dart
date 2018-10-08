/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Returns an Iterable that skips leading elements while test is satisfied.
 * @description Checks that the returned iterable contains elements of
 * Int32x4List skipping leading elements while test is satisfied.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(list, bool test(Int32x4 e)) {
  var l = new Int32x4List.fromList(list);
  var res = l.skipWhile(test);
  var it1 = l.iterator;
  var it2 = res.iterator;
  var count = 0;

  Expect.isTrue(res is Iterable);

  while (it1.moveNext()) {
    if (test(it1.current)) {
      count++;
    } else break;
  }
  Expect.equals(l.length - count, res.length);

  while (it2.moveNext()) {
    Expect.isTrue(equal(it1.current, it2.current));
    it1.moveNext();
  }
}

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  check(list, (e) => true);
  check(list, (e) => false);
  check(list, (e) => e.x == 0);
  check(list, (e) => e.x > 4);
  check(list, (e) => e.x < 4);
  check(list, (e) => e.x == 4);
}

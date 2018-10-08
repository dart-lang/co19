/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * Returns a new lazy Iterable with all elements that satisfy the predicate
 * test.
 * The matching elements have the same order in the returned iterable as they
 * have in iterator.
 * This method returns a view of the mapped elements.
 * @description Checks that the returned iterable contains all elements of
 * Int32x4List that satisfy test.
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
  var res = l.where(test);
  var count = 0;

  Expect.isTrue(res is Iterable);
  for (int i = 0; i < l.length; ++i) {
    if (test(l[i])) {
      Expect.isTrue(equal(l[i], res.elementAt(count++)));
    }
  }
  Expect.equals(count, res.length);
}

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  check([i32x4(6)], (e) => false);
  check(list, (e) => true);
  check(list, (e) => false);
  check(list, (e) => e.x == 0);
  check(list, (e) => e.x > 4);
  check(list, (e) => e.x < 4);
  check(list, (e) => e.x == 4);
}

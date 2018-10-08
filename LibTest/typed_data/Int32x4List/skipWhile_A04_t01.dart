/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * ...
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where test(element) returns true.
 * If all elements satisfy test the resulting iterable is empty, otherwise it
 * iterates the remaining elements in their original order, starting with the
 * first element for which test(element) returns false.
 * @description Checks that if all elements satisfy test the resulting iterable
 * is empty, otherwise it iterates the remaining elements in their original
 * order, starting with the first element for which test(element) returns false.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  bool test(e) => e.x < 5;
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);

  var res = l.skipWhile(test);
  Expect.isTrue(test(l[2]));
  Expect.isFalse(test(l[3]));
  for (int i = 0; i < res.length; ++i) {
    Expect.isTrue(equal(l[i + 3], res.elementAt(i)));
  }

  res = l.skipWhile((e) => e.x < 9);
  Expect.isTrue(res.isEmpty);
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * ...
 * The elements can be computed by stepping through iterator until an element is
 * found where test(element) is false. At that point, the returned iterable
 * stops (its moveNext() returns false).
 * @description Checks that the elements can be computed by stepping through
 * iterator until an element is found where test(element) is false. At that
 * point, the returned iterable stops (its moveNext() returns false).
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
  var res = l.takeWhile(test);
  var it = res.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.isTrue(equal(l[i++], it.current));
  }
  Expect.isFalse(test(l[i]));

  res = l.takeWhile((e) => e.x > 9);
  Expect.isTrue(res.isEmpty);
}
